<template>
  <Head :title="`Lab branch user #${lab_branch_user.id}`" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <div class="mx-auto">
      <p
        v-if="flash.notice"
        class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block"
      >
        {{ flash.notice }}
      </p>

      <h1 class="font-bold text-4xl">Lab branch user #{{ lab_branch_user.id }}</h1>

      <LabBranchUser :lab_branch_user="lab_branch_user" />

      <Link
        :href="`/lab_branch_users/${lab_branch_user.id}/edit`"
        class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
      >
        Edit this lab branch user
      </Link>
      <Link
        href="/lab_branch_users"
        class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
      >
        Back to lab branch users
      </Link>

      <div class="inline-block ml-2">
        <Link
          :href="`/lab_branch_users/${lab_branch_user.id}`"
          as="button"
          method="delete"
          class="mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium"
        >
          Destroy this lab branch user
        </Link>
      </div>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import LabBranchUser from './LabBranchUser.vue'

const { lab_branch_user, flash } = defineProps(['lab_branch_user', 'flash'])
</script>
