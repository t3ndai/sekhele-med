<template>

  <Head title="New patient" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">New patient</h1>

    <Form :patient="patient" submitText="Create Patient" @onSubmit="handleSubmit" />

    <Link href="/patients" class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
    Back to patients
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { patient, lab_branch_id } = defineProps(['patient', 'lab_branch_id'])

const handleSubmit = (form) => {
  form.transform((data) => ({ patient: data }))
  form.post(`/lab_branches/${lab_branch_id}/patients`)
}
</script>
