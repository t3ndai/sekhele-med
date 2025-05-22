<template>
  <form @submit.prevent="emit('onSubmit', form)" class="contents">
    <div class="my-5">
      <label for="name">Name</label>
      <input type="text" name="name" id="name" v-model="form.name"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.name" :class="$style.error">
        {{ form.errors.name.join(', ') }}
      </div>
    </div>


    <div class="inline">
      <button type="submit" :disabled="form.processing"
        class="rounded-lg py-3 px-5 bg-blue-600 text-white inline-block font-medium cursor-pointer">
        {{ submitText }}
      </button>
    </div>
  </form>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3'

const { lab_branch, submitText } = defineProps(['lab_branch', 'submitText'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  name: lab_branch.name || '',
  lab_id: lab_branch.lab_id || '',
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
