<template>

  <Head :title="`Patient procedure result #${patient_procedure_result.id}`" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <div class="mx-auto">
      <p v-if="flash.notice" class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block">
        {{ flash.notice }}
      </p>

      <h1 class="font-bold text-4xl">Patient procedure result #{{ patient_procedure_result.id }}</h1>

      <PatientProcedureResult :patient_procedure_result="patient_procedure_result" />

      <Link :href="`/patient_procedure_results/${patient_procedure_result.id}/edit`"
        class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
      Edit this patient procedure result
      </Link>
      <Link href="/patient_procedure_results" class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
      Back to patient procedure results
      </Link>

      <div class="inline-block ml-2">
        <Link :href="`/patient_procedure_results/${patient_procedure_result.id}`" as="button" method="delete"
          class="mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium">
        Destroy this patient procedure result
        </Link>
      </div>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import PatientProcedureResult from './PatientProcedureResult.vue'

const { patient_procedure_result, flash } = defineProps(['patient_procedure_result', 'flash', 'assignee', 'procedure'])
</script>
