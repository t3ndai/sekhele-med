<template>

  <Head :title="`Lab branch #${lab_branch.id}`" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <div class="mx-auto">
      <p v-if="flash.notice" class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block">
        {{ flash.notice }}
      </p>

      <h1 class="font-bold text-4xl">Branch: {{ lab_branch.name }}</h1>

      <LabBranch :lab_branch="lab_branch" />

      <div class="flex justify-between items-center">
        <h1 class="font-bold text-4xl">Lab branch users</h1>
        <Link :href="`/lab_admin/lab_branches/${lab_branch.id}/lab_branch_users/new`"
          class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium">
        New User
        </Link>
        <Link :href="`/lab_admin/lab_branches/${lab_branch.id}/lab_branch_users/`"
          class="rounded-lg py-3 px-5 bg-gray-600 text-white block font-medium">
        View Users
        </Link>
      </div>

      <div>
        <Link :href="`/lab_branches/${lab_branch.id}/edit`"
          class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
        Edit this branch
        </Link>
        <Link href="/lab_branches" class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
        Back to branches
        </Link>

        <div class="inline-block ml-2">
          <Link :href="`/lab_branches/${lab_branch.id}`" as="button" method="delete"
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
