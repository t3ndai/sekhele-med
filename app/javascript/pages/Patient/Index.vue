<template>
  <Head title="Patients" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <p
      v-if="flash.notice"
      class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block"
    >
      {{ flash.notice }}
    </p>

    <div class="flex justify-between items-center">
      <h1 class="font-bold text-4xl">Patients</h1>
      <Link
        href="/patients/new"
        class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium"
      >
        New patient
      </Link>
    </div>

    <div class="min-w-full">
      <template v-for="patient in patients" :key="patient.id">
        <Patient :patient="patient" />
        <p>
          <Link
            :href="`/patients/${patient.id}`"
            class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
          >
            Show this patient
          </Link>
        </p>
      </template>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Patient from './Patient.vue'

const { patients, flash } = defineProps(['patients', 'flash'])
</script>
