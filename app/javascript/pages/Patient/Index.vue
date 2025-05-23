<template>

  <Head title="Patients" />

  <div className="mx-auto w-full px-8 pt-8">
    <p v-if="flash.notice" class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block">
      {{ flash.notice }}
    </p>

    <div class="flex justify-between items-center">
      <h1 class="font-bold text-4xl">Patients</h1>
      <Link href="/patients/new" class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium">
      New patient
      </Link>
    </div>

    <div class="flex justify-between items-center">
      <DataTable :value="patients" class="w-full">
        <Column field="first_name" header="First Name" />
        <Column field="middle_names" header="Middle Names" />
        <Column field="last_name" header="Last Name" />
        <Column field="dob" header="Dob" />
        <Column field="address" header="Address" />
        <Column field="email" header="Email" />
        <Column field="phone" header="Phone" />
        <Column header="Actions">
          <template #body="slotProps">
            <div class="flex gap-x-2">
              <div>
                <Link :href="`/patients/${slotProps.data.id}/patient_visits/new`"
                  class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
                New Patient Visit
                </Link>
              </div>
              <div>
                <Link :href="`/patients/${slotProps.data.id}`"
                  class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
                Show
                </Link>
              </div>
            </div>
          </template>
        </Column>
      </DataTable>
    </div>

  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Patient from './Patient.vue'
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';

const { patients, flash } = defineProps(['patients', 'flash'])
</script>
