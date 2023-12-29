import { CAMPAIGN_TYPES } from '../constants/campaign';

export default {
  data() {
    return {
      campaignType: this.getCampaignType(),
      isOngoingType: this.getIsOngoingType(),
      isOnOffType: this.getIsOnOffType(),
      isWhatsapp: this.getIsWhatsapp(),
    };
  },
  watch: {
    // eslint-disable-next-line
    '$route'() {
      this.campaignType = this.getCampaignType();
      this.isOngoingType = this.getIsOngoingType();
      this.isOnOffType = this.getIsOnOffType();
      this.isWhatsapp = this.getIsWhatsapp();
    },
  },
  methods: {
    getCampaignType() {
      const pageURL = window.location.href;
      return pageURL.substring(pageURL.lastIndexOf('/') + 1);
    },
    getIsOngoingType() {
      return this.getCampaignType() === CAMPAIGN_TYPES.ONGOING;
    },
    getIsOnOffType() {
      return this.getCampaignType() === CAMPAIGN_TYPES.ONE_OFF;
    },
    getIsWhatsapp() {
      return this.getCampaignType() === CAMPAIGN_TYPES.WHATSAPP;
    },
  },
};