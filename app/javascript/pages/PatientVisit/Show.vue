<template>

  <Head :title="`Patient visit #${patient_visit.id}`" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <div class="mx-auto">
      <p v-if="flash.notice" class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block">
        {{ flash.notice }}
      </p>

      <h1 class="font-bold text-4xl">Patient visit #{{ patient_visit.id }}</h1>

      <PatientVisit :patient_visit="patient_visit" />

      <div class="flex justify-between items-center">
        <Link :href="`/patient_visits/${patient_visit.id}/patient_visit_billings/new`"
          class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium">
        Bill Patient
        </Link>
      </div>

      <div class="flex justify-between items-center">
        <h1 class="font-bold text-4xl">Patient procedures</h1>
        <Link :href="`/patient_visits/${patient_visit.id}/patient_procedures/new`"
          class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium">
        New patient procedure
        </Link>
      </div>

      <Link :href="`/patient_visits/${patient_visit.id}/edit`"
        class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
      Edit this patient visit
      </Link>
      <Link href="/patient_visits" class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
      Back to patient visits
      </Link>

      <div class="inline-block ml-2">
        <Link :href="`/patient_visits/${patient_visit.id}`" as="button" method="delete"
          class="mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium">
        Destroy this patient visit
        </Link>
      </div>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import PatientVisit from './PatientVisit.vue'

const { patient_visit, flash } = defineProps(['patient_visit', 'flash'])
</script>
