<template>

  <Head title="New patient visit billing" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">New patient visit billing</h1>

    <Form :patient_visit_billing="patient_visit_billing" :payment_methods submitText="Create Patient visit billing"
      @onSubmit="handleSubmit" />

    <Link href="/patient_visit_billings" class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
    Back to patient visit billings
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { patient_visit_billing, payment_methods, patient_visit_id } = defineProps(['patient_visit_billing', 'payment_methods', 'patient_visit_id'])

const handleSubmit = (form) => {
  form.transform((data) => ({ patient_visit_billing: data }))
  form.post(`/patient_visits/${patient_visit_id}/patient_visit_billings`)
}
</script>
