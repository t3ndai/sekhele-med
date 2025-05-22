<template>

  <Head :title="`Lab branch #${lab_branch.id}`" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <div class="mx-auto">
      <p v-if="flash.notice" class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block">
        {{ flash.notice }}
      </p>

      <h1 class="font-bold text-4xl">Lab branch #{{ lab_branch.id }}</h1>

      <LabBranch :lab_branch="lab_branch" />

      <div class="flex justify-between items-center">
        <h1 class="font-bold text-4xl">Referrers</h1>
        <Link :href="`/lab_branches/${lab_branch.id}/referrers/new`"
          class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium">
        New referrer
        </Link>
      </div>

    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import LabBranch from './LabBranch.vue'

const { lab_branch, flash } = defineProps(['lab_branch', 'flash'])
</script>
