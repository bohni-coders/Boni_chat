<template>
  <!-- @submit.prevent="onFormSubmit" -->
  <form class="conversation--form" @submit.prevent="onFormSubmit" >
    <div v-if="showNoInboxAlert" class="callout warning">
      <p>
        {{ $t('NEW_CONVERSATION.NO_INBOX') }}
      </p>
    </div>

    <!-- v-else -->
    <div v-else >
      <div>
        <div class="row gutter-small">
          <div class="columns">
            <label>
              {{ $t('NEW_CONVERSATION.FORM.INBOX.LABEL') }}
            </label>
            <div class="multiselect-wrap--small">
              <multiselect
                v-model="targetInbox"
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
              <span v-if="$v.targetInbox.$error" class="message">
                {{ $t('NEW_CONVERSATION.FORM.INBOX.ERROR') }}
              </span>
            </label>
          </div>

          <div class="columns">
            <label>
              {{ $t('NEW_CONVERSATION.FORM.TO.LABEL') }}
            </label>
            <!-- multiselect-wrap--small -->
            <div v-if="contacts" class="multiselect-container" @click.prevent="modalVisible = true">
              <button class="modal-button" >
                Select Contacts
              </button>
              <fluent-icon
                  class="icon"
                  icon="edit"
              />

              <woot-modal
                class="contacts-modal"
                :show.sync="modalVisible"
                :on-close="hideContactsModal"
                size="medium"
              >
                <whatsapp-campaign-contacts-view
                  @on-change-selection="setContacts"
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

        <div class="row">
          <div class="columns">
            <!-- v-else-if -->
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

      <div class="modal-footer">
        <button class="button clear" @click.prevent="onCancel">
          {{ $t('NEW_CONVERSATION.FORM.CANCEL') }}
        </button>
        <!-- @click.prevent="disableForm"    -->
        <woot-button
          type="submit"
          
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
import { required, requiredIf } from 'vuelidate/lib/validators';
import ContactAPI from 'dashboard/api/contacts';
import WhatsappCampaignsAPI from 'dashboard/api/whatsappCampaigns';
import ConversationApi from 'dashboard/api/conversations';
import ContactDropdownItem from 'dashboard/modules/contact/components/ContactDropdownItem.vue';
import WhatsappCampaignTemplate from './WhatsappCampaignTemplate.vue';
import WhatsappCampaignContactsView from './WhatsappCampaignContactsView.vue';

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
      payload: {},
      modalVisible: false,
    };
  },
  validations: {
    subject: {
      required: requiredIf('isAnEmailInbox'),
    },
    message: {
      // required,
    },
    targetInbox: {
      // required,
    },
    selectedContacts: {
      // required,
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
    replaceTextWithCannedResponse(message) {
      this.message = message;
    },
    toggleCannedMenu(value) {
      this.showCannedMenu = value;
    },
    prepareWhatsAppMessagePayload({ message: content, templateParams }) {
      const payload = this.selectedContacts.map(contact => {
        return {
          inbox_id: this.targetInbox.id,
          source_id: this.targetInbox.sourceId,
          contact_id: contact.id,
          message: { content, template_params: templateParams },
          assignee_id: this.currentUser.id,
        };
      });

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
      // this.createConversation(this.emailMessagePayload);
    },
    // async createConversation(payload) {
    //   try {
    //     const data = await this.onSubmit(payload);
    //     const action = {
    //       type: 'link',
    //       to: `/app/accounts/${data.account_id}/conversations/${data.id}`,
    //       message: this.$t('NEW_CONVERSATION.FORM.GO_TO_CONVERSATION'),
    //     };
    //     this.onSuccess();
    //     this.showAlert(
    //       this.$t('NEW_CONVERSATION.FORM.SUCCESS_MESSAGE'),
    //       action
    //     );
    //   } catch (error) {
    //     if (error instanceof ExceptionWithMessage) {
    //       this.showAlert(error.data);
    //     } else {
    //       this.showAlert(this.$t('NEW_CONVERSATION.FORM.ERROR_MESSAGE'));
    //     }
    //   }
    // },

    // async
    async onSubmit() {
      // let data = {};

      // for (const item of contactItems) {
      //   ConversationApi.create(item)
      //     .then(res => {
      //       data = res;
      //     })
      //     .catch(e => {
      //       this.showAlert(e.data);
      //     });

      // this.$store.dispatch(
      //   'contactConversations/create',
      //   item
      // ).then(res => {
      //   data = res;
      // }).catch(e => {
      //   this.showAlert(e.data)
      // });
      // }

      const campaignDetails = {
        message: this.payload.length > 0 ? this.payload[0].message.content : this.message,
        enabled: true,
        inbox_id: this.targetInbox.id,
        sender_id: this.currentUser.id,
        contacts: this.selectedContacts,
        message_template: this.payload.length > 0 ? this.payload[0] : {}, // contactItems[0].message,
      };


      console.log('campaign details', JSON.stringify(campaignDetails));

      await WhatsappCampaignsAPI.create(campaignDetails);

      // return data;
    },
    setContacts(contactsPayload) {
      this.selectedContacts = contactsPayload;
      console.log('inside form', this.selectedContacts);
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
      console.log("message template, payload :", messagePayload);


      console.log("messagepayload", messagePayload);

      let payload_this = this.prepareWhatsAppMessagePayload(messagePayload);


      console.log("payload", payload_this);



      this.payload = payload_this;
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

<style scoped lang="scss">
.modal-footer {
  margin-top: 15px;
  display: flex;
  justify-content: flex-end;
}

.multiselect-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  min-width: 100%;
  height: 3.9rem;
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

.canned-response {
  position: relative;
}

.input-group-label {
  font-size: var(--font-size-small);
}

.contact-input {
  display: flex;
  align-items: center;
  height: 3.9rem;
  background: var(--color-background-light);
  border: 1px solid var(--color-border);
  padding: var(--space-smaller) var(--space-small);
  border-radius: var(--border-radius-small);

  .contact-name {
    margin: 0;
    margin-left: var(--space-small);
    margin-right: var(--space-small);
  }
}

.message-input {
  min-height: 8rem;
}

.row.gutter-small {
  gap: var(--space-small);
}

::v-deep {
  .mention--box {
    left: 0;
    margin: auto;
    right: 0;
    top: unset;
    height: fit-content;
  }

  /* TODO: Remove when have standardized a component out of multiselect  */
  .multiselect .multiselect__content .multiselect__option span {
    display: inline-flex;
    width: var(--space-medium);
    color: var(--s-600);
  }
  .multiselect .multiselect__content .multiselect__option {
    padding: var(--space-micro) var(--space-smaller);
  }
}
</style>
