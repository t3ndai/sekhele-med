<template>
  <Head title="Patient procedures" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <p
      v-if="flash.notice"
      class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block"
    >
      {{ flash.notice }}
    </p>

    <div class="flex justify-between items-center">
      <h1 class="font-bold text-4xl">Patient procedures</h1>
      <Link
        href="/patient_procedures/new"
        class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium"
      >
        New patient procedure
      </Link>
    </div>

    <div class="min-w-full">
      <template v-for="patient_procedure in patient_procedures" :key="patient_procedure.id">
        <PatientProcedure :patient_procedure="patient_procedure" />
        <p>
          <Link
            :href="`/patient_procedures/${patient_procedure.id}`"
            class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
          >
            Show this patient procedure
          </Link>
        </p>
      </template>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import PatientProcedure from './PatientProcedure.vue'

const { patient_procedures, flash } = defineProps(['patient_procedures', 'flash'])
</script>
