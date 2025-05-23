<template>

  <Head title="Lab branches" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <p v-if="flash.notice" class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block">
      {{ flash.notice }}
    </p>

    <div class="flex justify-between items-center">
      <h1 class="font-bold text-4xl">Lab branches</h1>
      <Link href="/lab_branches/new" class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium">
      New lab branch
      </Link>
    </div>

    <div class="min-w-full">
      <template v-for="lab_branch in lab_branches" :key="lab_branch.id">
        <LabBranch :lab_branch="lab_branch" />
        <p>
          <Link :href="`/lab_admin/lab_branches/${lab_branch.id}`"
            class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
          Show this lab branch
          </Link>
        </p>
      </template>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import LabBranch from './LabBranch.vue'

const { lab_branches, flash } = defineProps(['lab_branches', 'flash'])
</script>
