<template>
  <form @submit.prevent="emit('onSubmit', form)" class="contents">
    <div class="my-5">
      <label for="procedure">Procedure</label>
      <Select :options="procedures" optionValue="id" optionLabel="name" name="procedure" id="procedure"
        v-model="form.procedure_id"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.procedure_id" :class="$style.error">
        {{ form.errors.procedure_id.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="lab_branch_user">Assignee:</label>
      <Select :options="assignees" optionLabel="name" optionValue="id" name="lab_branch_user" id="lab_branch_user"
        v-model="form.lab_branch_user_id"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.lab_branch_user_id" :class="$style.error">
        {{ form.errors.lab_branch_user_id.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="procedure_on">Procedure on</label>
      <input type="date" name="procedure_on" id="procedure_on" v-model="form.procedure_on"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.procedure_on" :class="$style.error">
        {{ form.errors.procedure_on.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="procedure_at">Procedure at</label>
      <input type="time" name="procedure_at" id="procedure_at" v-model="form.procedure_at"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.procedure_at" :class="$style.error">
        {{ form.errors.procedure_at.join(', ') }}
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

const { patient_procedure, submitText, procedures, assignees } = defineProps(['patient_procedure', 'submitText', 'assignees', 'procedures'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  procedure_id: patient_procedure.procedure_id || '',
  lab_branch_user_id: patient_procedure.lab_branch_user_id || '',
  procedure_on: patient_procedure.procedure_on || '',
  procedure_at: patient_procedure.procedure_at || '',
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
