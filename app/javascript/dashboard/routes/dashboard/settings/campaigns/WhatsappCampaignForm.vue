<template>
  <form class="conversation--form h-auto overflow-auto flex flex-col" @submit.prevent="onFormSubmit" >
    <div v-if="showNoInboxAlert" class="callout warning">
      <p>
        {{ $t('NEW_CONVERSATION.NO_INBOX') }}
      </p>
    </div>

    <div v-else >
      <div>
        <div class="flex flex-col">
          <woot-input
            v-model="title"
            :label="$t('CAMPAIGN.ADD.FORM.TITLE.LABEL')"
            type="text"
            :class="{ error: $v.title.$error }"
            :error="$v.title.$error ? $t('CAMPAIGN.ADD.FORM.TITLE.ERROR') : ''"
            :placeholder="$t('CAMPAIGN.ADD.FORM.TITLE.PLACEHOLDER')"
            @blur="$v.title.$touch"
          />
        </div>

        <div class="flex justify-between">
          <div class="flex flex-col w-[45%]">
            <label>
              {{ $t('NEW_CONVERSATION.FORM.INBOX.LABEL') }}
            </label>
            <div class="h-[42px]">
              <multiselect
                v-model="targetInbox"
                v-bind:disabled="this.selectedContacts.length === 0"
                track-by="id"
                label="name"
                :placeholder="$t('FORMS.MULTISELECT.SELECT')"
                selected-label=""
                select-label=""
                deselect-label=""
                :max-height="160"
                :close-on-select="true"
                :options="[...inboxes]"
              >
                <template slot="singleLabel" slot-scope="{ option }">
                  <inbox-dropdown-item
                    v-if="option.name"
                    :name="option.name"
                    :inbox-identifier="computedInboxSource(option)"
                    :channel-type="option.channel_type"
                  />
                  <span v-else>
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
              <span v-if="$v.targetInbox.$error && !selectedContacts" class="message">
                {{ $t('NEW_CONVERSATION.FORM.INBOX.ERROR') }}
              </span>
            </label>
          </div>

          <div class="flex flex-col w-[45%]">
            <label>
              {{ $t('NEW_CONVERSATION.FORM.TO.LABEL') }}
            </label>
            <div v-if="contacts" class="multiselect-container">
              <div
                class="flex justify-around w-full items-center"
                @click.prevent="showContactsModal"
              >
                <button class="modal-button">
                  {{ this.selectedContacts.length > 0 ? `${this.selectedContacts.length} Contacts Selected` : "Select Contacts" }}
                </button>
                <fluent-icon class="icon" icon="edit" />
              </div>

              <woot-modal
                class="contacts-modal"
                :show.sync="modalVisible"
                :on-close="hideContactsModal"
                size="medium"
              >
                <whatsapp-campaign-contacts-view
                  @on-change-selection="setContacts"
                  :on-close="hideContactsModal"
                />
              </woot-modal>
            </div>
            <label :class="{ error: $v.selectedContacts.$error }">
              <span v-if="$v.selectedContacts.$error" class="message">
                {{ $t('NEW_CONVERSATION.FORM.INBOX.ERROR') }}
              </span>
            </label>
          </div>
        </div>

        <div class="flex">
          <div class="flex flex-col w-full">
            <whatsapp-campaign-template
              v-if="hasWhatsappTemplates"
              :inbox-id="targetInbox.id"
              @on-select-template="toggleWaTemplate"
              @on-send="onSendWhatsAppReply"
            />
            <label v-else :class="{ error: $v.message.$error }">
              {{ $t('NEW_CONVERSATION.FORM.MESSAGE.LABEL') }}
              <textarea
                v-model="message"
                class="message-input"
                type="text"
                :placeholder="$t('NEW_CONVERSATION.FORM.MESSAGE.PLACEHOLDER')"
                @input="$v.message.$touch"
              />
              <span v-if="$v.message.$error" class="message">
                {{ $t('NEW_CONVERSATION.FORM.MESSAGE.ERROR') }}
              </span>
            </label>         
          </div>
        </div>
      </div>

      <div :style="{ border: 'solid 0.5px', marginTop: '10px' }" ></div>

      <div class="modal-footer">
        <button class="button clear" @click.prevent="onCancel">
          {{ $t('NEW_CONVERSATION.FORM.CANCEL') }}
        </button>
        <woot-button
          type="submit"
          :is-disabled="this.enabled && this.message.length === 0"
        >
          {{ 'Send Campaign' }}
        </woot-button>
      </div>
    </div>
  </form>
</template> 

<script>
import { mapGetters } from 'vuex';
import Thumbnail from 'dashboard/components/widgets/Thumbnail';
import WootMessageEditor from 'dashboard/components/widgets/WootWriter/Editor';
import ReplyEmailHead from 'dashboard/components/widgets/conversation/ReplyEmailHead';
import CannedResponse from 'dashboard/components/widgets/conversation/CannedResponse.vue';
import InboxDropdownItem from 'dashboard/components/widgets/InboxDropdownItem';
import WhatsappTemplates from 'dashboard/routes/dashboard/conversation/contact/WhatsappTemplates.vue';
import alertMixin from 'shared/mixins/alertMixin';
import { INBOX_TYPES } from 'shared/mixins/inboxMixin';
import { ExceptionWithMessage } from 'shared/helpers/CustomErrors';
import { getInboxSource } from 'dashboard/helper/inbox';

import ContactAPI from 'dashboard/api/contacts';
import WhatsappCampaignsAPI from 'dashboard/api/whatsappCampaigns';
import ConversationApi from 'dashboard/api/conversations';
import ContactDropdownItem from 'dashboard/modules/contact/components/ContactDropdownItem.vue';
import WhatsappCampaignTemplate from './WhatsappCampaignTemplate.vue';
import WhatsappCampaignContactsView from './WhatsappCampaignContactsView.vue';

import { required, requiredIf } from 'vuelidate/lib/validators';


export default {
  components: {
    Thumbnail,
    WootMessageEditor,
    ReplyEmailHead,
    CannedResponse,
    WhatsappTemplates,
    WhatsappCampaignTemplate,
    WhatsappCampaignContactsView,
    InboxDropdownItem,
    ContactDropdownItem,
  },
  mixins: [alertMixin],
  props: {
    disableForm: {
      type: Function,
      default: () => {},
    },
  },
  data() {
    return {
      title: '',
      name: '',
      subject: '',
      message: '',
      showCannedResponseMenu: false,
      cannedResponseSearchKey: '',
      bccEmails: '',
      ccEmails: '',
      targetInbox: {},
      selectedContacts: [],
      contacts: [],
      whatsappTemplateSelected: false,
      payload: [],
      modalVisible: false,
      enabled: true,
      headerParams: [],
    };
  },
  validations: {
    subject: {
      required: requiredIf('isAnEmailInbox'),
    },
    title: {
      required,
    },
    message: {
      required: !requiredIf('hasWhatsappTemplates'),
    },
    targetInbox: {
      required,
    },
    selectedContacts: {
      required,
    },  
  },
  computed: {
    ...mapGetters({
      uiFlags: 'contacts/getUIFlags',
      conversationsUiFlags: 'contactConversations/getUIFlags',
      currentUser: 'getCurrentUser',
      contactList: 'contacts/getContacts',
      inboxList: 'inboxes/getWhatsAppInboxes',
    }),
    emailMessagePayload() {
      const payload = this.selectedContacts.map(contact => {
        return {
          inbox_id: this.targetInbox.id,
          source_id: this.targetInbox.sourceId,
          contact_id: contact.id,
          mail_subject: this.subject,
          message: { content, template_params: templateParams },
          assignee_id: this.currentUser.id,
        };
      });
      if (this.ccEmails) {
        payload.message.cc_emails = this.ccEmails;
      }

      if (this.bccEmails) {
        payload.message.bcc_emails = this.bccEmails;
      }
      return payload;
    },
    showNoInboxAlert() {
      if (!this.contacts) {
        return false;
      }
      return this.inboxes.length === 0 && !this.uiFlags.isFetchingInboxes;
    },
    inboxes() {
      return this.inboxList.map(inbox => ({
        ...inbox,
        sourceId: inbox.channel_id,
      }));
    },
    isAnEmailInbox() {
      return (
        this.targetInbox && this.targetInbox.channel_type === INBOX_TYPES.EMAIL
      );
    },
    isAnWebWidgetInbox() {
      return (
        this.targetInbox && this.targetInbox.channel_type === INBOX_TYPES.WEB
      );
    },
    isEmailOrWebWidgetInbox() {
      return this.isAnEmailInbox || this.isAnWebWidgetInbox;
    },
    hasWhatsappTemplates() {
      return !!this.targetInbox?.message_templates;
    },
  },
  mounted() {
    this.contactsfun()
      .then(res => {
        this.contacts = res;
      })
      .catch(e => {
        this.showAlert(e.data);
      });

      // console.log(inboxList);

      // console.log($v.targetInbox);

    // ----------------------------------------------------------------------------------------------------------------------
  },
  watch: {
    message(value) {
      
    },
  },
  methods: {
    onCancel() {
      this.$emit('cancel');
      this.disableForm();
    },
    onSuccess() {
      this.$emit('success');
    },
    hideContactsModal() {
      this.modalVisible = false;
    },
    showContactsModal() {
      this.modalVisible = true;
    },
    replaceTextWithCannedResponse(message) {
      this.message = message;
    },
    toggleCannedMenu(value) {
      this.showCannedMenu = value;
    },
    prepareWhatsAppMessagePayload({ message: content, templateParams }) {

      let processed_params = {};
      
      [...Object.values(templateParams.processed_params), ...this.headerParams].forEach((value, index) => {
        processed_params[index] = value;
      });

      const payload = this.selectedContacts.map(contact => {
        return {
          inbox_id: this.targetInbox.id,
          source_id: this.targetInbox.sourceId,
          contact_id: contact.id,
          message: { content, template_params: {...templateParams, processed_params: processed_params} },
          assignee_id: this.currentUser.id,
        };
      });

      console.log('payload: ', payload);

      return payload;
    },
    onFormSubmit() {
      this.$v.$touch();
      if (this.$v.$invalid) {
        console.log('invalid......')
        return;
      }

      this.onSubmit();

      this.disableForm();
    },

    async onSubmit() {
      this.message = this.payload.length > 0 ? this.payload[0].message.content : this.message;

      const campaignDetails = {
        title: this.title,
        message: this.message,
        enabled: true,
        inbox_id: this.targetInbox.id,
        sender_id: this.currentUser.id,
        contacts: this.selectedContacts,
        message_template: this.payload.length > 0 ? this.payload[0] : {}, // contactItems[0].message,
      };

      await WhatsappCampaignsAPI.create(campaignDetails);

      this.$track(CAMPAIGNS_EVENTS.CREATE_CAMPAIGN, {
          type: 'whatsapp',
      });
    },
    setContacts(contactsPayload) {
      this.selectedContacts = contactsPayload;
    },
    async contactsfun() {
      const res = await ContactAPI.get();

      const ct = res.data.payload;

      return ct;
    },
    runCreateConversation() {},
    // ------------------------------------------------------------------------------------------------------------------
    toggleWaTemplate(val) {
      this.whatsappTemplateSelected = val;
    },
    onSendWhatsAppReply(messagePayload) {
      console.log("messagepayload", messagePayload);

      if(messagePayload.id) {
        console.log("inside if")


        this.enabled = true;

        let headers = messagePayload.components.filter(comp => {
          return comp.format === 'IMAGE';
        })

        this.headerParams = headers.map(header => header.example.header_handle).flat();

        console.log(this.headerParams);

      }else if(messagePayload.message) {
        console.log("else if")


        this.enabled = false;
  
        let payload_this = this.prepareWhatsAppMessagePayload(messagePayload);
  
  
        console.log("payload", payload_this);
  
        this.payload = payload_this;
      }

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
  },
};
</script>

<style lang="scss" scoped>
.modal-footer {
  margin-top: 25px;
  display: flex;
  justify-content: flex-end;
}

.message-input {
  width: 100%;
  height: 8rem;
}

.multiselect-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  min-width: 100%;
  height: 43px;
  background-color: white;

  padding: var(--space-smaller) var(--space-small);
  border: 2px solid var(--color-border);
  border-radius: var(--border-radius-small);
}

.modal-button {
  min-width: 60%;
  height: 3.9rem;
  text-align: start;
  font-size: 14px;
  font-weight: 400;
}
.conversation--form {
  padding: var(--space-normal) var(--space-large) var(--space-large);
  width: 600px;
}
</style>