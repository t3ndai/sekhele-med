<template>
  <Head title="Lab branch users" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <p
      v-if="flash.notice"
      class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block"
    >
      {{ flash.notice }}
    </p>

    <div class="flex justify-between items-center">
      <h1 class="font-bold text-4xl">Lab branch users</h1>
      <Link
        href="/lab_branch_users/new"
        class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium"
      >
        New lab branch user
      </Link>
    </div>

    <div class="min-w-full">
      <template v-for="lab_branch_user in lab_branch_users" :key="lab_branch_user.id">
        <LabBranchUser :lab_branch_user="lab_branch_user" />
        <p>
          <Link
            :href="`/lab_branch_users/${lab_branch_user.id}`"
            class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
          >
            Show this lab branch user
          </Link>
        </p>
      </template>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import LabBranchUser from './LabBranchUser.vue'

const { lab_branch_users, flash } = defineProps(['lab_branch_users', 'flash'])
</script>
