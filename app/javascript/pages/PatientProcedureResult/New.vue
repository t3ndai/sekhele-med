<template>

  <Head title="New patient procedure result" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">New patient procedure result</h1>

    <Form :patient_procedure_result="patient_procedure_result" :assignees submitText="Create Patient procedure result"
      @onSubmit="handleSubmit" />

    <Link href="/patient_procedure_results" class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
    Back to patient procedure results
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { patient_procedure_result, assignees, patient_procedure_id } = defineProps(['patient_procedure_result', 'assignees', 'patient_procedure_id'])

const handleSubmit = (form) => {
  form.transform((data) => ({ patient_procedure_result: data }))
  form.post(`/patient_procedures/${patient_procedure_id}/patient_procedure_results`, {
    forceFormData: true,
  })
}
</script>
