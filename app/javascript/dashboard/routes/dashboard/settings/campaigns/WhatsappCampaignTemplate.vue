<template>
  <div class="row">
    <wa-templates-picker
      v-if="!selectedWaTemplate"
      :inbox-id="inboxId"
      @onSelect="pickTemplate"
    />
    <wa-template-parser
      v-else
      :template="selectedWaTemplate"
      @resetTemplate="onResetTemplate"
      @sendMessage="onSendMessage"
    />
  </div>
</template>

<script>
import WaTemplatesPicker from './WaTemplatePicker.vue';
import WaTemplateParser from './WaTemplateParser.vue';

export default {
  components: {
    WaTemplatesPicker,
    WaTemplateParser,
  },
  props: {
    inboxId: {
      type: Number,
      default: undefined,
    },
    show: {
      type: Boolean,
      default: true,
    },
  },
  data() {
    return {
      selectedWaTemplate: null,
    };
  },
  methods: {
    pickTemplate(template) {
      this.$emit('pickTemplate', true);
      this.selectedWaTemplate = template;
      this.$emit('on-send', template);
    },
    onResetTemplate() {
      this.$emit('pickTemplate', false);
      this.selectedWaTemplate = null;
    },
    onSendMessage(message) {
      this.$emit('on-send', message);
    },
    onClose() {
      this.$emit('cancel');
    },
  },
};
</script>

<style></style>
