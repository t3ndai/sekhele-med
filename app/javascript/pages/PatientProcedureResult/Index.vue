<template>
  <Head title="Patient procedure results" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <p
      v-if="flash.notice"
      class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block"
    >
      {{ flash.notice }}
    </p>

    <div class="flex justify-between items-center">
      <h1 class="font-bold text-4xl">Patient procedure results</h1>
      <Link
        href="/patient_procedure_results/new"
        class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium"
      >
        New patient procedure result
      </Link>
    </div>

    <div class="min-w-full">
      <template v-for="patient_procedure_result in patient_procedure_results" :key="patient_procedure_result.id">
        <PatientProcedureResult :patient_procedure_result="patient_procedure_result" />
        <p>
          <Link
            :href="`/patient_procedure_results/${patient_procedure_result.id}`"
            class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
          >
            Show this patient procedure result
          </Link>
        </p>
      </template>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import PatientProcedureResult from './PatientProcedureResult.vue'

const { patient_procedure_results, flash } = defineProps(['patient_procedure_results', 'flash'])
</script>
