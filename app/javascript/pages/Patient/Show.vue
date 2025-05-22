<template>
  <Head :title="`Patient #${patient.id}`" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <div class="mx-auto">
      <p
        v-if="flash.notice"
        class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block"
      >
        {{ flash.notice }}
      </p>

      <h1 class="font-bold text-4xl">Patient #{{ patient.id }}</h1>

      <Patient :patient="patient" />

      <Link
        :href="`/patients/${patient.id}/edit`"
        class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
      >
        Edit this patient
      </Link>
      <Link
        href="/patients"
        class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
      >
        Back to patients
      </Link>

      <div class="inline-block ml-2">
        <Link
          :href="`/patients/${patient.id}`"
          as="button"
          method="delete"
          class="mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium"
        >
          Destroy this patient
        </Link>
      </div>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Patient from './Patient.vue'

const { patient, flash } = defineProps(['patient', 'flash'])
</script>
