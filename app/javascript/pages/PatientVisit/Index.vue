<template>
  <Head title="Patient visits" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <p
      v-if="flash.notice"
      class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block"
    >
      {{ flash.notice }}
    </p>

    <div class="flex justify-between items-center">
      <h1 class="font-bold text-4xl">Patient visits</h1>
      <Link
        href="/patient_visits/new"
        class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium"
      >
        New patient visit
      </Link>
    </div>

    <div class="min-w-full">
      <template v-for="patient_visit in patient_visits" :key="patient_visit.id">
        <PatientVisit :patient_visit="patient_visit" />
        <p>
          <Link
            :href="`/patient_visits/${patient_visit.id}`"
            class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
          >
            Show this patient visit
          </Link>
        </p>
      </template>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import PatientVisit from './PatientVisit.vue'

const { patient_visits, flash } = defineProps(['patient_visits', 'flash'])
</script>
