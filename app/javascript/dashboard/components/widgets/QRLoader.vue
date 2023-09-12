<template>
  <div class="loader-container">
    <div class="w-full">
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
  </div>
</template>

<script>
import { io } from 'socket.io-client';
import 'highlight.js/styles/default.css';
import configMixin from 'shared/mixins/configMixin';

export default {
  mixins: [configMixin],
  props: {
    imageLoaded: { type: Boolean, default: false },
    imageSource: { type: String, default: '' },
    qrData: { type: Function, default: null },
  },
  data() {
    return {
      internalImageLoaded: this.imageLoaded,
      progress: 0,
      progressBarWidth: '0%',
      socket: null,
      socketState: 'connected',
    };
  },
  mounted() {
    let url = process.env.FRONTEND_URL || 'http://0.0.0.0:3000'; // cross check with env

    this.initSocket(url);
  },
  methods: {
    changeImageSource(res) {
      this.$emit('update:imageSource', res.qrData); // dummy
      this.$emit('update:imageLoaded', true);

      this.internalImageLoaded = res.qrData !== '';
    },
    updateProgress() {
      if (this.internalImageLoaded) {
        this.progressBarWidth = '100%';
        this.progress = 100;
      } else if (this.progress <= 95) {
        this.progress += 2;
        this.progressBarWidth = this.progress + '%';
      }
    },
    initSocket(url) {
      this.socket = io(url);

      this.socket.on('dataEvent', data => {
        const route = data.route;

        if (this.progress < 100) this.updateProgress();

        switch (route) {
          case '/socket.io':
            bus.$emit('newToastMessage', JSON.stringify(data));

            this.$emit('update:imageSource', data);
            this.$emit('update:imageLoaded', true);

            this.internalImageLoaded = true;

            this.progress = 100;
            this.progressBarWidth = this.progress + '%';
            break;
          default:
          // Handle unknown or default route
        }
      });

      this.socket.on('connect_error', error => {
        bus.$emit('newToastMessage', error);
      });

      this.socket.on('disconnect', reason => {
        bus.$emit('newToastMessage', reason);
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.loader-container {
  position: relative;
  padding-top: 300px;

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
}
</style>
