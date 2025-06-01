<template>

  <Head title="Lab branch users" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <p v-if="flash.notice" class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block">
      {{ flash.notice }}
    </p>

    <div class="flex justify-between items-center">
      <h1 class="font-bold text-4xl">{{ branch_name }} Staff</h1>
      <Link :href="`/lab_admin/lab_branches/${lab_branch_id}/`"
        class="rounded-lg py-3 px-5 bg-slate-600 text-white block font-medium">
      Back to Branch
      </Link>
      <Link :href="`/lab_admin/lab_branches/${lab_branch_id}/lab_branch_users/new`"
        class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium">
      New Staff
      </Link>
    </div>

    <div class="mt-4">
      <DataTable :value="lab_branch_users" responsiveLayout="scroll">
        <Column field="name" header="Name"></Column>
        <Column field="role" header="Role"></Column>
        <Column field="actions" header="Actions">
          <template #body="slotProps">
            <Link :href="`/lab_admin/lab_branch_users/${slotProps.data.id}`"
              class="rounded-lg py-3 px-5 bg-gray-400 text-white block font-medium">
            View
            </Link>
          </template>
        </Column>
      </DataTable>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import LabBranchUser from './LabBranchUser.vue'
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';

const { lab_branch_users, flash, lab_branch_id, branch_name } = defineProps(['lab_branch_users', 'flash', 'lab_branch_id', 'branch_name'])
</script>
