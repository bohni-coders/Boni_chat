<template>
  <div class="wizard-body w-full flex-shrink-0 flex-grow-0 max-w-[75%]">
    <h4
      class="text-slate-700 dark:text-slate-200 block text-center w-full text-4xl font-thin mt-[30%]"
    >
      Generating QR Code
    </h4>
    <h6
      class="block text-slate-500 dark:text-slate-400 text-center my-4 w-full mx-auto"
    >
      This might take a while...
    </h6>
    <div class="loader">
      <div class="load-value" :style="{ width: progressBarWidth }" />
    </div>
  </div>
</template>

<script>
import { fetchQRCode } from 'shared/helpers/qr_code';

export default {
  props: {
    imageLoaded: { type: Boolean, default: false },
    imageSource: { type: String, default: '' },
    url: { type: String, default: null },
  },
  data() {
    return {
      internalImageLoaded: this.imageLoaded,
      progress: 0,
      progressBarWidth: '0%',
      socket: null,
    };
  },
  mounted() {
    this.updateProgressBar();
  },
  methods: {
    async changeImageSource() {
      try {
        const res = await fetchQRCode(this.qrData);

        this.$emit('update:imageSource', res.qrData);

        this.internalImageLoaded = res.qrData !== '';
      } catch {
        this.internalImageLoaded = false;

        throw new Error('QR Not Loaded!');
      }
    },
    async updateProgressBar() {
      if (this.progress <= 85) {
        this.progressBarWidth = this.progress + '%';
        this.progress += 2.5;

        if (this.progress % 10 === 0) this.changeImageSource();

        setTimeout(this.updateProgressBar, 100);
      } else if (!this.internalImageLoaded) {
        if (this.progress > 85 && this.progress <= 95) {
          this.progressBarWidth = this.progress + '%';
          setTimeout(this.updateProgressBar, 100);
        } else if (this.progress < 100) {
          setTimeout(this.updateProgressBar, 100);
        }

        this.progress += 2;

        // if (this.progress >= 90) {
        //   this.internalImageLoaded = true;
        //   //  bus.$emit('newToastMessage', 'Dummy Url');
        //   this.$emit(
        //     'update:imageSource',
        //     'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=Example'
        //   );
        // }

        if (this.progress >= 100)
          bus.$emit('newToastMessage', 'Failed To Load QR Code!!!');
      } else if (this.imageSource !== '') {
        this.$emit('update:imageLoaded', true);

        this.progressBarWidth = '100%';
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.loader {
  margin-left: 15%;
  margin-right: 15%;
  top: 45%;
  width: 70%;
  height: 13.458px;
  flex-shrink: 0;
  border-radius: 16px;
  background: rgba(201, 215, 227, 1);
  align-items: start;

  .load-value {
    flex-shrink: 0;
    border-radius: 16px;
    height: 13.458px;
    background: rgba(55, 84, 109, 1);
  }

  @keyframes progress {
    0% {
      width: 0%;
    }

    100% {
      width: 100%;
    }
  }
}
</style>
