<template>
  <Head title="New patient procedure" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">New patient procedure</h1>

    <Form
      :patient_procedure="patient_procedure"
      submitText="Create Patient procedure"
      @onSubmit="handleSubmit"
    />

    <Link
      href="/patient_procedures"
      class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Back to patient procedures
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { patient_procedure } = defineProps(['patient_procedure'])

const handleSubmit = (form) => {
  form.transform((data) => ({ patient_procedure: data }))
  form.post('/patient_procedures')
}
</script>
