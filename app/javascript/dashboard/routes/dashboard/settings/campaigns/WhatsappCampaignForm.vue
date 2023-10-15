<template>
  <form type="submit" @submit.prevent="onFormSubmit">
    <div v-if="showNoInboxAlert" class="callout warning">
      <p>
        {{ $t('NEW_CONVERSATION.NO_INBOX') }}
      </p>
    </div>
    <div v-else>
      <div class="row gutter-small">
        <div class="columns">
          <label>
            {{ $t('CAMPAIGN.ADD.WHATSAPP_FORM.CONTACT_SINGLE_SELECT_LABEL') }}
          </label>
          <div>
            <multiselect
              v-model="selectedSender"
              :placeholder="$t('FORMS.MULTISELECT.SELECT')"
              :options="[...inboxes]"
              :multiple="false"
              selected-label=""
              select-label=""
              :close-on-select="true"
              :clear-on-select="false"
              :preserve-search="true"
              track-by="id"
              label="name"
              :preselect-first="false"
            >
              <template slot="singleLabel" slot-scope="{ option }">
                <inbox-dropdown-item
                  v-if="option.name"
                  class="px-py-0"
                  :name="option.name"
                  :inbox-identifier="computedInboxSource(option)"
                  :channel-type="option.channel_type"
                />
                <span v-else class="py-0 px-0">
                  {{ $t('NEW_CONVERSATION.FORM.INBOX.PLACEHOLDER') }}
                </span>
              </template>
              <template slot="option" slot-scope="{ option }">
                <inbox-dropdown-item
                  :name="option.name"
                  :inbox-identifier="computedInboxSource(option)"
                  :channel-type="option.channel_type"
                />
              </template>
            </multiselect>
          </div>
          <label :class="{ error: $v.targetInbox.$error }">
            <span v-if="$v.targetInbox.$error" class="message">
              {{ $t('NEW_CONVERSATION.FORM.INBOX.ERROR') }}
            </span>
          </label>
        </div>
        <div class="columns">
          <label>
            {{ $t('CAMPAIGN.ADD.WHATSAPP_FORM.CONTACT_MULTISELECT_LABEL') }}
          </label>
          <div>
            <multiselect
              v-model="selectedContacts"
              :options="[...contacts]"
              :multiple="true"
              :close-on-select="false"
              :clear-on-select="false"
              :preserve-search="true"
              placeholder="Select Contacts"
              label="name"
              track-by="name"
              :preselect-first="false"
            >
              <template slot="selection" slot-scope="{ values, isOpen }">
                <span
                  v-if="values.length"
                  v-show="!isOpen"
                  class="multiselect__single"
                >
                  {{ values.length }} contacts selected
                </span>
              </template>
            </multiselect>
          </div>
          <label :class="{ error: $v.targetInbox.$error }">
            <span v-if="$v.targetInbox.$error" class="message">
              {{ $t('NEW_CONVERSATION.FORM.INBOX.ERROR') }}
            </span>
          </label>
        </div>
      </div>

      <div class="row">
        <div class="columns">
          <div class="w-full">
            <label class="editor-wrap">
              {{ $t('CAMPAIGN.ADD.FORM.MESSAGE.LABEL') }}
              <whatsapp-templates
                v-if="hasWhatsappTemplates"
                :inbox-id="selectedInbox.id"
                @on-select-template="toggleWaTemplate"
                @on-send="onSendWhatsAppReply"
              />
              <woot-message-editor
                v-model="message"
                class="message-editor"
                :enable-variables="true"
                :class="{ editor_warning: $v.message.$error }"
                :placeholder="$t('CAMPAIGN.ADD.FORM.MESSAGE.PLACEHOLDER')"
                @blur="$v.message.$touch"
                @change="handleMessageChange"
              />
              <span v-if="$v.message.$error" class="editor-warning__message">
                {{ $t('CAMPAIGN.ADD.FORM.MESSAGE.ERROR') }}
              </span>
            </label>
          </div>
        </div>
      </div>

      <!-- Container 4 -->
      <div class="container">
        <label for="normalInput">
          Normal Input:
          <div class="row">
            <woot-input v-model="normalInput" />
            <label class="or"> or </label>
            <woot-button @click="performAction">Create Image URL</woot-button>
          </div>
        </label>
      </div>

      <!-- Container 5 -->
      <div class="modal-footer">
        <!-- <woot-button variant="clear" @click.prevent="onClose">
          {{ $t('CAMPAIGN.ADD.CANCEL_BUTTON_TEXT') }}
        </woot-button> -->
        <woot-button :is-loading="uiFlags.isCreating">
          {{ $t('CAMPAIGN.ADD.WHATSAPP_FORM.SEND_BUTTON_TEXT') }}
        </woot-button>
      </div>
    </div>
  </form>
</template>

<script>
import { mapGetters } from 'vuex';
import WootMessageEditor from 'dashboard/components/widgets/WootWriter/Editor';
import InboxDropdownItem from 'dashboard/components/widgets/InboxDropdownItem';
import WhatsappTemplates from 'dashboard/routes/dashboard/conversation/contact/WhatsappTemplates.vue';
import alertMixin from 'shared/mixins/alertMixin';
import { ExceptionWithMessage } from 'shared/helpers/CustomErrors';
import { getInboxSource } from 'dashboard/helper/inbox';
import { required } from 'vuelidate/lib/validators';

// import 'dashboard/assets/scss/plugins/_multiselect.scss';
import Multiselect from 'vue-multiselect';

import ContactApi from 'dashboard/api/contacts';

export default {
  components: {
    WootMessageEditor,
    WhatsappTemplates,
    InboxDropdownItem,
    Multiselect,
  },
  mixins: [alertMixin],
  props: {
    addCampaign: { type: Function, default: null },
  },
  data() {
    return {
      name: '',
      subject: '',
      message: '',
      showCannedResponseMenu: false,
      cannedResponseSearchKey: '',
      bccEmails: '',
      ccEmails: '',
      targetInbox: {},
      whatsappTemplateSelected: false,
      numInputs: 0,
      childInputs: [],
      normalInput: '',
      selectedSender: {},
      contact: {},
      selectedContacts: this.inboxes,
      selectedItems: [],
      searchText: '',
      isDropdownOpen: false,
      options: [], // Your list of options
      varCount: 0,
    };
  },
  computed: {
    ...mapGetters({
      uiFlags: 'contacts/getUIFlags',
      conversationsUiFlags: 'contactConversations/getUIFlags',
      currentUser: 'getCurrentUser',
    }),
    handleMessageChange() {
      return this.countDoubleCurlyBraces(this.message);
    },
    range() {
      let start = 1;
      let end = this.handleMessageChange();
      return Array.from(
        { length: end - start + 1 },
        (_, index) => start + index
      );
    },
    filteredOptions() {
      // Filter options based on the search text
      return this.options.filter(option =>
        option.name.toLowerCase().includes(this.searchText.toLowerCase())
      );
    },
    selectedInbox: {
      get() {
        const inboxList = this.inboxes;

        return (
          inboxList.find(inbox => inbox.id === this.targetInbox.id) || {
            inbox: {},
          }
        );
      },
      set(value) {
        this.targetInbox = value;
      },
    },
    showNoInboxAlert() {
      if (!this.inboxes) {
        return false;
      }
      return this.inboxes.length === 0 && !this.uiFlags.isFetchingInboxes;
    },
    inboxes() {
      const inboxList = this.$store.getters['inboxes/getWhatsAppInboxes'];
      return inboxList.map(inbox => ({
        ...inbox,
        sourceId: inbox.channel_id, // source_id ?
      }));
    },
    hasWhatsappTemplates() {
      return !!this.selectedInbox?.message_templates;
    },
  },
  watch: {
    message(value) {
      this.hasSlashCommand = value[0] === '/' && !this.isEmailOrWebWidgetInbox;
      const hasNextWord = value.includes(' ');
      const isShortCodeActive = this.hasSlashCommand && !hasNextWord;
      if (isShortCodeActive) {
        this.cannedResponseSearchKey = value.substring(1);
        this.showCannedResponseMenu = true;
      } else {
        this.cannedResponseSearchKey = '';
        this.showCannedResponseMenu = false;
      }
    },
  },
  mounted() {},
  validations: {
    message: {
      required,
    },
    targetInbox: {
      required,
    },
    selectedSender: {
      required,
    },
    selectedContacts: {
      required,
    },
  },
  methods: {
    toggleDropdown() {
      this.isDropdownOpen = !this.isDropdownOpen;
      if (this.isDropdownOpen) {
        this.$nextTick(() => {
          this.$refs.searchInput.focus();
        });
      }
    },
    closeDropdown() {
      this.isDropdownOpen = false;
    },
    selectItem(item) {
      if (!this.selectedItems.includes(item)) {
        this.selectedItems.push(item);
      }
      this.searchText = '';
      this.isDropdownOpen = false;
    },
    removeItem(index) {
      this.selectedItems.splice(index, 1);
    },
    async onSubmit(contactItem) {
      const data = await this.$store.dispatch(
        'contactConversations/create',
        contactItem
      );
      return data;
    },
    onCancel() {
      this.$emit('cancel');
    },
    onSuccess() {
      this.$emit('success');
    },
    prepareWhatsAppMessagePayload({ message: content, templateParams }) {
      const payload = {
        inboxId: this.targetInbox.id,
        sourceId: this.targetInbox.sourceId,
        contactId: this.contact.id,
        message: { content, template_params: templateParams },
        assigneeId: this.currentUser.id,
      };
      return payload;
    },
    onFormSubmit() {
      this.$v.$touch();
      if (this.$v.$invalid) {
        return;
      }
      this.createConversation(this.emailMessagePayload);
    },
    async createConversation(payload) {
      try {
        const data = await this.onSubmit(payload);
        const action = {
          type: 'link',
          to: `/app/accounts/${data.account_id}/conversations/${data.id}`,
          message: this.$t('NEW_CONVERSATION.FORM.GO_TO_CONVERSATION'),
        };
        this.onSuccess();
        this.showAlert(
          this.$t('NEW_CONVERSATION.FORM.SUCCESS_MESSAGE'),
          action
        );
      } catch (error) {
        if (error instanceof ExceptionWithMessage) {
          this.showAlert(error.data);
        } else {
          this.showAlert(this.$t('NEW_CONVERSATION.FORM.ERROR_MESSAGE'));
        }
      }
    },

    toggleWaTemplate(val) {
      this.whatsappTemplateSelected = val;
    },
    async onSendWhatsAppReply(messagePayload) {
      const payload = this.prepareWhatsAppMessagePayload(messagePayload);
      await this.createConversation(payload);
    },
    inboxReadableIdentifier(inbox) {
      return `${inbox.name} (${inbox.channel_type})`;
    },
    computedInboxSource(inbox) {
      if (!inbox.channel_type) return '';
      const classByType = getInboxSource(
        inbox.channel_type,
        inbox.phone_number,
        inbox
      );
      return classByType;
    },
    async getContacts() {
      const contacts = await ContactApi.getContacts();

      return contacts.data;
    },
    generateChildInputs() {
      this.childInputs = Array.from({ length: this.numInputs }, () => ({
        selectedOption: '',
        inputText: '',
      }));
    },
    addNewInput() {
      this.childInputs.push({
        selectedOption: '',
        inputText: '',
      });
    },
    performAction() {
      // Handle action for Container 4
    },
    cancelForm() {
      // Handle cancel button click for Container 5
    },
    submitForm() {
      this.$emit('form-submitted', this.formData);
    },
  },
};
</script>

<style lang="scss" scoped>
.input-group-label {
  font-size: var(--font-size-small);
}

.message-input {
  min-height: 8rem;
}

.row.gutter-small {
  gap: var(--space-small);
}

.row {
  display: flex;
  flex-direction: row;
  align-items: baseline;
}

.multiselect-wrap--medium {
  .multiselect {
    display: flex;
    align-items: center;
    width: 50%;

    .multiselect_tags {
      width: 100%;
    }
  }
}

.multiselect_tags span {
  padding: 0;
}

.or {
  margin: 5px;
}

.container {
  display: flex;
  margin-bottom: 20px;
  justify-content: space-between;
}

.child-container {
  display: flex;
  flex-direction: row;
  align-items: baseline;
  margin-top: 5px;
}

.child-container select {
  margin-right: 10px;
}
</style>
