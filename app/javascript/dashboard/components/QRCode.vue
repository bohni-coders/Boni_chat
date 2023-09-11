<template>
  <div class="code--container">
    <div class="code--action-area">
      <form
        v-if="enableCodePen"
        class="code--codeopen-form"
        action="https://codepen.io/pen/define"
        method="POST"
        target="_blank"
      >
        <input type="hidden" name="data" :value="codepenScriptValue" />

        <button type="submit" class="button secondary tiny">
          {{ $t('COMPONENTS.CODE.CODEPEN') }}
        </button>
      </form>
    </div>
    <highlightjs v-if="script" :language="lang" :code="script" />
  </div>
</template>

<script>
import 'highlight.js/styles/default.css';
import { copyTextToClipboard } from 'shared/helpers/clipboard';
import { validateQRCode } from 'shared/helpers/qr_code';

export default {
  props: {
    script: {
      type: String,
      default: '',
    },
    lang: {
      type: String,
      default: 'javascript',
    },
  },
  computed: {
    codepenScriptValue() {
      const lang = this.lang === 'javascript' ? 'js' : this.lang;
      return JSON.stringify({
        title: this.codepenTitle,
        private: true,
        [lang]: this.script,
      });
    },
  },
  methods: {
    // changes here onkar ---------------------
    async onCopy(e) {
      e.preventDefault();
      await copyTextToClipboard(this.script);
      bus.$emit('newToastMessage', this.$t('COMPONENTS.CODE.COPY_SUCCESSFUL'));
    },
    async onScan(e) {
      e.preventDefault();
      await validateQRCode(this.script);
      bus.$emit();
    },
  },
};
</script>

<style lang="scss" scoped>
.code--container {
  position: relative;
  text-align: left;

  .code--action-area {
    top: var(--space-small);
    position: absolute;
    right: var(--space-small);
  }

  .code--codeopen-form {
    display: inline-block;
  }
}
</style>
