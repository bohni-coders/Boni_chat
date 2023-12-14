<template>
  <div class="conversation--form">
    <div>
      <h4><b>New Campaign</b></h4>
      <h5>Start a new campaign by selecting an already approved template</h5>
    </div>
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
      <div></div>
    </div>
  </div>
</template>

<script>
export default {
  components: {},
  mixins: [],
  data() {
    return {};
  },
  computed: {},
  mounted() {},
  methods: {},
};
</script>

<style scoped lang="scss"></style>
