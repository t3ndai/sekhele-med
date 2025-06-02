<template>

  <Head :title="`Patient visit #${patient_visit.id}`" />

  <div className="mx-auto w-full px-8 pt-8">
    <div class="mx-auto">
      <p v-if="flash.notice" class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block">
        {{ flash.notice }}
      </p>

      <h1 class="font-bold text-4xl">{{ patient }}: {{ patient_visit.visit_on }} Visit</h1>

      <PatientVisit :patient_visit="patient_visit" :referrer />

      <div class="flex justify-between items-center">
        <Link :href="`/patient_visits/${patient_visit.id}/patient_visit_billings/new`"
          class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium" v-if="!patient_visit.is_billed">
        Bill Patient
        </Link>
        <Link :href="`${patient_visit_billing_url}`"
          class="rounded-lg py-3 px-5 bg-green-600 text-white block font-medium" v-if="patient_visit.is_billed">
        View Bill
        </Link>
      </div>

      <div class="flex flex-col justify-between  mt-4">
        <div class="flex justify-between">
          <h1 class="font-bold text-4xl">Patient procedures</h1>
          <Link :href="`/patient_visits/${patient_visit.id}/patient_procedures/new`"
            class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium" v-if="!patient_visit.is_billed">
          New patient procedure
          </Link>
        </div>
        <div>
          <DataTable :value="patient_visit.patient_procedures" responsiveLayout="scroll">
            <Column field="name" header="Procedure"></Column>
            <Column field="assignee" header="Assignee"></Column>
            <Column field="on" header="Procedure On"></Column>
            <Column field="at" header="Procedure At"></Column>
            <Column field="actions" header="Actions">
              <template #body="slotProps">
                <Link :href="`/patient_procedures/${slotProps.data.id}`"
                  class="rounded-lg py-3 px-5 bg-gray-400 text-white block font-medium">View</Link>
              </template>
            </Column>
          </DataTable>
        </div>
      </div>

      <div class="flex mt-8 justify-between items-center">
        <Link :href="`/patient_visits/${patient_visit.id}/edit`"
          class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
        Edit this patient visit
        </Link>

        <Link :href="`${patient_url}`" class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
        Back to Patient
        </Link>

        <div class="inline-block ml-2">
          <Link :href="`/patient_visits/${patient_visit.id}`" as="button" method="delete"
            class="mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium">
          Destroy this patient visit
          </Link>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import PatientVisit from './PatientVisit.vue'
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';

const { patient_visit, flash, patient, referrer, patient_url, patient_visit_billing_url } = defineProps(['patient_visit', 'flash', 'patient', 'referrer',
  'patient_url', 'patient_visit_billing_url'])
</script>