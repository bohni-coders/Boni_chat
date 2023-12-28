<template>
  <div class="flex-1 overflow-auto p-4">
    <woot-button
      color-scheme="success"
      class-names="button--fixed-top"
      icon="add-circle"
      @click="openAddPopup"
    >
      {{ buttonText }}
    </woot-button>
    <campaign v-if="!this.isWhatsapp" />
    <woot-modal
      v-if="!this.isWhatsapp"
      :show.sync="showAddPopup"
      :on-close="hideAddPopup"
    >
      <add-campaign @on-close="hideAddPopup" />
    </woot-modal>
    <!-- WhatsappCampaign -->
    <whatsapp-campaign v-if="this.isWhatsapp && !this.showWhatsappForm" />
    <whatsapp-campaign-form
      v-if="this.isWhatsapp && this.showWhatsappForm"
      :disable-form="hideAddPopup"
    />
  </div>
</template>

<script>
import campaignMixin from 'shared/mixins/campaignMixin';
import Campaign from './Campaign.vue';
import AddCampaign from './AddCampaign';
import WhatsappCampaign from './WhatsappCampaign.vue';
import WhatsappCampaignForm from './WhatsappCampaignForm.vue';

export default {
  components: {
    Campaign,
    WhatsappCampaign,
    WhatsappCampaignForm,
    AddCampaign,
  },
  mixins: [campaignMixin],
  data() {
    return {
      showAddPopup: false,
      showWhatsappForm: false,
    };
  },
  computed: {
    buttonText() {
      if (this.isOngoingType) {
        return this.$t('CAMPAIGN.HEADER_BTN_TXT.ONGOING');
      } else if (this.isOnOffType) {
        return this.$t('CAMPAIGN.HEADER_BTN_TXT.ONE_OFF');
      } else {
        return this.$t('CAMPAIGN.HEADER_BTN_TXT.WHATSAPP');
      }
    },
  },
  mounted() {
    this.$store.dispatch('campaigns/get');
  },
  methods: {
    openAddPopup() {
      if (!this.isWhatsapp) this.showAddPopup = true;
      else if (this.isWhatsapp) this.showWhatsappForm = true;
    },
    hideAddPopup() {
      if (!this.isWhatsapp) this.showAddPopup = false;
      else if (this.isWhatsapp) this.showWhatsappForm = false;
    },
  },
};
</script>
