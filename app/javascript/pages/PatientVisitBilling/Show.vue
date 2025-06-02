<template>

  <Head :title="`Patient visit billing #${patient_visit_billing.id}`" />

  <div className="mx-auto w-full px-8 pt-8">
    <div class="mx-auto">
      <p v-if="flash.notice" class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block">
        {{ flash.notice }}
      </p>

      <h1 class="font-bold text-4xl">Patient visit billing #{{ patient_visit_billing.patient_visit.patient }} -
        {{ patient_visit_billing.patient_visit.visit_on }}</h1>

      <PatientVisitBilling :patient_visit_billing="patient_visit_billing" />

      <Link :href="`/patient_visit_billings/${patient_visit_billing.id}/edit`"
        class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
      Edit this patient visit billing
      </Link>
      <Link :href="`${patient_visit_url}`" class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
      Back to patient visit
      </Link>

      <div class="inline-block ml-2">
        <Link :href="`/patient_visit_billings/${patient_visit_billing.id}`" as="button" method="delete"
          class="mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium">
        Destroy this patient visit billing
        </Link>
      </div>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import PatientVisitBilling from './PatientVisitBilling.vue'

const { patient_visit_billing, flash, patient_visit_url } = defineProps(['patient_visit_billing', 'flash', 'patient_visit_url'])
</script>
