<template>
  <Head title="Editing patient visit" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">Editing patient visit</h1>

    <Form
      :patient_visit="patient_visit"
      submitText="Update Patient visit"
      @onSubmit="handleSubmit"
    />

    <Link
      :href="`/patient_visits/${patient_visit.id}`"
      class="mt-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Show this patient visit
    </Link>
    <Link
      href="/patient_visits"
      class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Back to patient visits
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { patient_visit } = defineProps(['patient_visit'])

const handleSubmit = (form) => {
  form.transform((data) => ({ patient_visit: data }))
  form.post(`/patient_visits/${patient_visit.id}`, {
    headers: { 'X-HTTP-METHOD-OVERRIDE': 'put' },
  })
}
</script>
