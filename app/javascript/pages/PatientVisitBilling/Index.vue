<template>
  <Head title="Patient visit billings" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <p
      v-if="flash.notice"
      class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block"
    >
      {{ flash.notice }}
    </p>

    <div class="flex justify-between items-center">
      <h1 class="font-bold text-4xl">Patient visit billings</h1>
      <Link
        href="/patient_visit_billings/new"
        class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium"
      >
        New patient visit billing
      </Link>
    </div>

    <div class="min-w-full">
      <template v-for="patient_visit_billing in patient_visit_billings" :key="patient_visit_billing.id">
        <PatientVisitBilling :patient_visit_billing="patient_visit_billing" />
        <p>
          <Link
            :href="`/patient_visit_billings/${patient_visit_billing.id}`"
            class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
          >
            Show this patient visit billing
          </Link>
        </p>
      </template>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import PatientVisitBilling from './PatientVisitBilling.vue'

const { patient_visit_billings, flash } = defineProps(['patient_visit_billings', 'flash'])
</script>
