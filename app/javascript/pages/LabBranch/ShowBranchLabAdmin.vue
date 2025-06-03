<template>

  <Head :title="`Lab branch #${lab_branch.id}`" />

  <div className="w-full px-8 pt-8">
    <div class="mx-auto">
      <p v-if="flash.notice" class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block">
        {{ flash.notice }}
      </p>

      <div class="flex justify-between items-center">
        <h1 class="font-bold text-4xl">Branch: {{ lab_branch.name }}</h1>
        <Link href="/lab_admin" class="rounded-lg py-3 px-5 bg-gray-600 text-white block font-medium">
        Back to Dashboard
        </Link>
      </div>

      <div class="flex mt-8 gap-x-6">
        <div class="rounded bg-green-200 px-8 py-4">
          <div class="text-2xl font-bold">{{ lab_branch.today_visits }}</div>
          <div class="text-gray-500">Today Visits</div>
        </div>

        <div class="rounded bg-green-200 px-8 py-4">
          <div class="text-2xl font-bold">${{ lab_branch.today_receipts }}</div>
          <div class="text-gray-500">Today Receipts</div>
        </div>
      </div>


      <div class="flex justify-between items-center">
        <h1 class="font-bold text-4xl">Branch Staff</h1>
        <Link :href="`/lab_admin/lab_branches/${lab_branch.id}/lab_branch_users/new`"
          class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium">
        New Staff
        </Link>
        <Link :href="`/lab_admin/lab_branches/${lab_branch.id}/lab_branch_users/`"
          class="rounded-lg py-3 px-5 bg-gray-600 text-white block font-medium">
        View Staff
        </Link>
      </div>

      <div class="mt-8">
        <h1 class="font-bold text-4xl">Procedure Stats: Today</h1>
        <DataTable :value="lab_branch.procedures_stats" responsiveLayout="scroll">
          <Column field="name" header="Procedure"></Column>
          <Column field="count" header="Count"></Column>
          <Column field="billed_amount" header="Billed"></Column>
          <Column field="paid_amount" header="Paid"></Column>
        </DataTable>
      </div>

      <div class="flex mt-8 justify-between items-center">
        <Link :href="`/lab_branches/${lab_branch.id}/edit`"
          class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
        Edit this branch
        </Link>
        <Link href="/lab_admin" class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
        Back to Admin Dashboard
        </Link>

        <div class="inline-block ml-2">
          <Link :href="`/lab_admin/lab_branches/${lab_branch.id}`" as="button" method="delete"
            class="mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium">
          Destroy this branch
          </Link>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import LabBranch from './LabBranch.vue'
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';

const { lab_branch, flash } = defineProps(['lab_branch', 'flash'])
</script>
