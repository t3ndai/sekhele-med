<template>
  <form @submit.prevent="emit('onSubmit', form)" class="contents">
    <div class="my-5">
      <label for="company_name">Company name</label>
      <input
        type="text"
        name="company_name"
        id="company_name"
        v-model="form.company_name"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full"
      />
      <div v-if="form.errors.company_name" :class="$style.error">
        {{ form.errors.company_name.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="trading_name">Trading name</label>
      <input
        type="text"
        name="trading_name"
        id="trading_name"
        v-model="form.trading_name"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full"
      />
      <div v-if="form.errors.trading_name" :class="$style.error">
        {{ form.errors.trading_name.join(', ') }}
      </div>
    </div>

    <div class="inline">
      <button
        type="submit"
        :disabled="form.processing"
        class="rounded-lg py-3 px-5 bg-blue-600 text-white inline-block font-medium cursor-pointer"
      >
        {{ submitText }}
      </button>
    </div>
  </form>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3'

const { lab, submitText } = defineProps(['lab', 'submitText'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  company_name: lab.company_name || '',
  trading_name: lab.trading_name || '',
})
</script>

<style module>
.label {
  display: block;
}
.error {
  color: red;
}
</style>
