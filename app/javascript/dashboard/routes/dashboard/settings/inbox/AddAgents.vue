<template>
  <div class="wizard-body columns content-box small-9">
    <form class="row" @submit.prevent="addAgents()">
      <div class="medium-12 columns">
        <page-header
          :header-title="$t('INBOX_MGMT.ADD.AGENTS.TITLE')"
          :header-content="$t('INBOX_MGMT.ADD.AGENTS.DESC')"
        />
      </div>
      <div class="medium-7 columns">
        <div class="medium-12 columns">
          <label :class="{ error: $v.selectedAgents.$error }">
            {{ $t('INBOX_MGMT.ADD.AGENTS.TITLE') }}
            <multiselect
              v-model="selectedAgents"
              :options="agentList"
              track-by="id"
              label="name"
              :multiple="true"
              :close-on-select="false"
              :clear-on-select="false"
              :hide-selected="true"
              selected-label
              :select-label="$t('FORMS.MULTISELECT.ENTER_TO_SELECT')"
              :deselect-label="$t('FORMS.MULTISELECT.ENTER_TO_REMOVE')"
              :placeholder="$t('INBOX_MGMT.ADD.AGENTS.PICK_AGENTS')"
              @select="$v.selectedAgents.$touch"
            />
            <span v-if="$v.selectedAgents.$error" class="message">
              {{ $t('INBOX_MGMT.ADD.AGENTS.VALIDATION_ERROR') }}
            </span>
          </label>
        </div>
        <div class="medium-12 columns">
          <woot-submit-button
            :button-text="$t('INBOX_MGMT.AGENTS.BUTTON_TEXT')"
            :loading="isCreating"
          />
        </div>
      </div>
    </form>
  </div>
</template>

<script>
/* eslint no-console: 0 */
import { mapGetters } from 'vuex';

import InboxMembersAPI from '../../../../api/inboxMembers';
import router from '../../../index';
import PageHeader from '../SettingsSubPageHeader';

export default {
  components: {
    PageHeader,
  },

  validations: {
    selectedAgents: {
      isEmpty() {
        return !!this.selectedAgents.length;
      },
    },
  },

  data() {
    return {
      selectedAgents: [],
      isCreating: false,
    };
  },

  computed: {
    ...mapGetters({
      agentList: 'agents/getAgents',
    }),
  },

  mounted() {
    this.$store.dispatch('agents/get');
  },

  methods: {
    async addAgents() {
      this.isCreating = true;
      const inboxId = this.$route.params.inbox_id;
      const selectedAgents = this.selectedAgents.map(x => x.id);

      try {
        const qrData = await InboxMembersAPI.update({
          inboxId,
          agentList: selectedAgents,
        });
        router.replace({
          name: 'settings_inbox_finish',
          params: {
            page: 'new',
            inbox_id: this.$route.params.inbox_id,
            qr_data: qrData,
          },
        });
      } catch (error) {
        bus.$emit('newToastMessage', error.message);
      }
      this.isCreating = false;
    },
  },
};
</script>
