<template>
  <Head title="Editing patient" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">Editing patient</h1>

    <Form
      :patient="patient"
      submitText="Update Patient"
      @onSubmit="handleSubmit"
    />

    <Link
      :href="`/patients/${patient.id}`"
      class="mt-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Show this patient
    </Link>
    <Link
      href="/patients"
      class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Back to patients
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { patient } = defineProps(['patient'])

const handleSubmit = (form) => {
  form.transform((data) => ({ patient: data }))
  form.patch(`/patients/${patient.id}`)
}
</script>
