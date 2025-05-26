<template>
  <form @submit.prevent="emit('onSubmit', form)" class="contents">
    <div class="my-5">
      <label for="note">Notes</label>
      <textarea name="note" id="note" v-model="form.notes" rows="4"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.notes" :class="$style.error">
        {{ form.errors.notes.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="image">Images</label>
      <input type="file" name="image[]" id="image" @input="form.images = $event.target.files[0]"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.images" :class="$style.error">
        {{ form.errors.images.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="lab_branch_user">Report By:</label>
      <Select :options="assignees" optionValue="id" optionLabel="name" type="text" name="lab_branch_user"
        id="lab_branch_user" v-model="form.lab_branch_user_id"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.lab_branch_user_id" :class="$style.error">
        {{ form.errors.lab_branch_user_id.join(', ') }}
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
import { Select } from 'primevue'

const { patient_procedure_result, submitText, assignees } = defineProps(['patient_procedure_result', 'submitText', 'assignees'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  notes: patient_procedure_result.notes || '',
  images: patient_procedure_result.images || '',
  lab_branch_user_id: patient_procedure_result.lab_branch_user_id || '',
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
