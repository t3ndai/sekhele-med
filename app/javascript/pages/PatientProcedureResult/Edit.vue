<template>
  <Head title="Editing patient procedure result" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">Editing patient procedure result</h1>

    <Form
      :patient_procedure_result="patient_procedure_result"
      submitText="Update Patient procedure result"
      @onSubmit="handleSubmit"
    />

    <Link
      :href="`/patient_procedure_results/${patient_procedure_result.id}`"
      class="mt-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Show this patient procedure result
    </Link>
    <Link
      href="/patient_procedure_results"
      class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Back to patient procedure results
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { patient_procedure_result } = defineProps(['patient_procedure_result'])

const handleSubmit = (form) => {
  form.transform((data) => ({ patient_procedure_result: data }))
  form.post(`/patient_procedure_results/${patient_procedure_result.id}`, {
    headers: { 'X-HTTP-METHOD-OVERRIDE': 'put' },
  })
}
</script>
