<template>

  <Head title="New patient visit" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">New patient visit</h1>

    <Form :patient_visit="patient_visit" :referrers submitText="Create Patient visit" @onSubmit="handleSubmit" />

    <Link :href="`${lab_branch_patients_url}`" class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
    Back to Patients
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { patient_visit, referrers, patient_id, lab_branch_patients_url } = defineProps(['patient_visit', 'referrers', 'patient_id', 'lab_branch_patients_url'])

const handleSubmit = (form) => {
  form.transform((data) => ({ patient_visit: data }))
  form.post(`/patients/${patient_id}/patient_visits`)
}
</script>
