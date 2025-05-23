<template>
  <Head :title="`Patient procedure #${patient_procedure.id}`" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <div class="mx-auto">
      <p
        v-if="flash.notice"
        class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block"
      >
        {{ flash.notice }}
      </p>

      <h1 class="font-bold text-4xl">Patient procedure #{{ patient_procedure.id }}</h1>

      <PatientProcedure :patient_procedure="patient_procedure" />

      <Link
        :href="`/patient_procedures/${patient_procedure.id}/edit`"
        class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
      >
        Edit this patient procedure
      </Link>
      <Link
        href="/patient_procedures"
        class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
      >
        Back to patient procedures
      </Link>

      <div class="inline-block ml-2">
        <Link
          :href="`/patient_procedures/${patient_procedure.id}`"
          as="button"
          method="delete"
          class="mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium"
        >
          Destroy this patient procedure
        </Link>
      </div>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import PatientProcedure from './PatientProcedure.vue'

const { patient_procedure, flash } = defineProps(['patient_procedure', 'flash'])
</script>
