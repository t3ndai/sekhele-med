<template>

  <Head :title="`Patient #${patient.id}`" />

  <div className="w-full px-8 pt-8">
    <div class="flex flex-col gap-y-8 mx-auto">
      <p v-if="flash.notice" class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block">
        {{ flash.notice }}
      </p>

      <h1 class="font-bold text-4xl">Patient - {{ patient.full_name }}</h1>

      <Patient :patient="patient" />

      <div>
        <h1 class="font-bold text-4xl">Patient visits</h1>
        <DataTable :value="patient.patient_visits" responsiveLayout="scroll">
          <Column field="visit_on" header="Visit On"></Column>
          <Column field="visit_time" header="Visit Time"></Column>
          <Column field="referrer" header="Referrer"></Column>
          <Column field="is_billed" header="Is Billed"></Column>
          <Column field="visit_type" header="Visit Type"></Column>
          <Column field="actions" header="Actions">
            <template #body="slotProps">
              <Link :href="`/patient_visits/${slotProps.data.id}`"
                class="rounded-lg py-3 px-5 bg-gray-400 text-white block font-medium">View</Link>
            </template>
          </Column>
        </DataTable>
      </div>

      <div class="flex justify-between mt-8">
        <Link :href="`/patients/${patient.id}/edit`"
          class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
        Edit this patient
        </Link>
        <Link :href="`${patients_url}`" class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
        Back to patients
        </Link>

        <div class="inline-block ml-2">
          <Link :href="`/patients/${patient.id}`" as="button" method="delete"
            class="mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium">
          Destroy this patient
          </Link>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Patient from './Patient.vue'
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';

const { patient, flash, patients_url } = defineProps(['patient', 'flash', 'patients_url'])
</script>
