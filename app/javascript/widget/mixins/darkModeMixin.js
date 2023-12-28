import { mapGetters } from 'vuex';

export default {
  computed: {
    ...mapGetters({ darkMode: 'appConfig/darkMode' }),
    prefersDarkMode() {

      const isOSOnDarkMode =
        this.darkMode === 'auto' &&
        window.matchMedia('(prefers-color-scheme: dark)').matches;

      return isOSOnDarkMode || this.darkMode === 'dark';
    },
  },
  watch: {
    darkMode() {
      // This function will run whenever [darkMode](file:///home/onkar/projects/bow_traila_2/app/javascript/widget/mixins/darkModeMixin.js#5%2C21-5%2C21) changes
      this.prefersDarkMode();
    },
  },
  methods: {
    $dm(light, dark) {
      if (this.darkMode === 'light') {
        return light;
      }
      if (this.darkMode === 'dark') {
        return dark;
      }
      return light + ' ' + dark;
    },
  },
};
