<template>
  <div class="flex">
    <span class="variable-label">
      {{ itemKey }}
    </span>

    <div class="multiselect-wrap--small mr-2 mb-0 ml-2">
      <select v-model="selectedOption" class="select-no-margin">
        <option value="" class="font-light">
          {{ $t('FORMS.MULTISELECT.SELECT') + ' type' }}
        </option>
        <option v-for="option in dropdownOptions" :key="option" :value="option">
          {{ option }}
        </option>
      </select>
    </div>
    <woot-input
      v-if="selectedOption && !selectedOption.includes('custom_attributes')"
      v-model="!selectedOption.includes('Set your own') ? variableInputValue : processedParams[itemKey]"
      :readonly="!selectedOption.includes('Set your own')"
      :change-event="e => editInputInfo(e)"
      type="text"
      placeholder="Type your variable"
      class="variable-input"
      :styles="{ marginBottom: 0 }"
    />
    <div
      v-else-if="selectedOption && selectedOption.includes('custom_attributes')"
      class="multiselect-wrap--small mr-2 mb-0 ml-2"
    >
      <select
        v-model="selectedCustomAttribute"
        :disabled="customAttributes.length <= 0"
        class="select-no-margin"
      >
        <option value="" class="font-light">
          {{ $t('FORMS.MULTISELECT.SELECT') + ' one' }}
        </option>
        <option
          v-for="option in customAttributes"
          :key="option"
          :value="option"
        >
          {{ option }}
        </option>
      </select>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    processedParams: {
      type: Object,
      default: () => {},
    },
    dropdownOptions: {
      type: Array,
      default: () => [],
    },
    itemKey: {
      type: String,
      default: '',
    },
    contactList: {
      type: Array,
      default: () => [],
    },
    selectedContacts: {
      type: Array,
      default: () => [],
    },
    currentUser: {
      type: Object,
      default: () => {},
    },
    editProcessedParams: {
      type: Function,
      default: () => {},
    },
  },
  data() {
    return {
      selectedOption: '',
      variableInputValue: '',
      customAttributes: [],
      selectedCustomAttribute: '',
    };
  },
  watch: {
    variableInputValue() {
      if (this.selectedOption.includes('Set your own')) {
        this.editProcessedParams(this.itemKey, this.variableInputValue);
      }
      // else if (this.selectedOption.includes('custom_attributes')) {
      //   this.editProcessedParams(
      //     this.itemKey,
      //     `{{${this.selectedCustomAttribute}}}`
      //   );
      // }
      else {
        this.editProcessedParams(this.itemKey, `{{${this.selectedOption}}}`);
      }
    },
    processedParams() {
      this.variableInputValue = this.processedParams[this.itemKey];
    },
    selectedOption() {
      this.evaluateInputValue();
    },
    selectedCustomAttribute() {
      this.editProcessedParams(
        this.itemKey,
        `{{customAttribute:${this.selectedCustomAttribute}}}`
      );
    },
  },
  methods: {
    editInputInfo(e) {
      if (this.variableInputValue !== e.target.value) {
        this.variableInputValue = e.target.value;
      }
    },
    contacts() {
      return this.contactList;
    },
    user() {
      return this.currentUser;
    },
    evaluateInputValue() {
      const selectedOption = this.selectedOption;
      const selectedContacts = this.selectedContacts;

      if (!selectedOption || selectedOption.includes('Set your own')) {
        this.variableInputValue = '';
      } else if (selectedOption.includes('custom_attributes')) {
        // custom attributes has been selected

        // create a variable to store what will be found in the custom_attributes
        const attributeStore = new Set(this.customAttributes);
        this.contacts()?.forEach(item => {
          // filter out contacts not selected and contacts that do not have custom_attributes
          if (
            selectedContacts.includes(item.id) &&
            Object.values(item.custom_attributes).length > 0
          ) {
            // add custom_attributes to the store
            Object.keys(item.custom_attributes).forEach(indKey =>
              attributeStore.add(indKey)
            );
          }
        });

        // return customAttributes being displayed to array form
        this.customAttributes = [...attributeStore];
        this.variableInputValue = this.selectedCustomAttribute;
      } else {
        this.variableInputValue = this.contacts()
          ?.filter(item => selectedContacts.includes(item.id))
          .map(ind => {
            try {
              if (selectedOption.includes('company')) {
                return ind.additional_attributes?.company_name;
              }
              return ind[selectedOption];
            } catch (error) {
              return '';
            }
          })
          .join(',')
          .slice(0, 50)
          .concat('...');
      }
    },
  },
};
</script>

<style scoped lang="scss">
.template__variables-container {
  @apply p-2.5;
}

.variables-label {
  @apply text-sm font-semibold mb-2.5;
}

.template__variable-item {
  @apply items-center flex mb-2.5;

  .label {
    @apply text-xs;
  }

  .variable-input {
    @apply flex-1 text-sm ml-2.5;
  }

  .variable-label {
    @apply bg-slate-75 dark:bg-slate-700 text-slate-700 dark:text-slate-100 inline-block rounded-md text-xs py-2.5 px-6;
  }
}

footer {
  @apply flex justify-end;

  button {
    @apply ml-2.5;
  }
}
.error {
  @apply bg-red-100 dark:bg-red-100 rounded-md text-red-800 dark:text-red-800 p-2.5 text-center;
}
.template-input {
  @apply bg-slate-25 dark:bg-slate-900 text-slate-700 dark:text-slate-100;
}

.select-no-margin {
  margin: 0;
}
</style>
