<template>
  <Head :title="`Lab user #${lab_user.id}`" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <div class="mx-auto">
      <p
        v-if="flash.notice"
        class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block"
      >
        {{ flash.notice }}
      </p>

      <h1 class="font-bold text-4xl">Lab user #{{ lab_user.id }}</h1>

      <LabUser :lab_user="lab_user" />

      <Link
        :href="`/lab_users/${lab_user.id}/edit`"
        class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
      >
        Edit this lab user
      </Link>
      <Link
        href="/lab_users"
        class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
      >
        Back to lab users
      </Link>

      <div class="inline-block ml-2">
        <Link
          :href="`/lab_users/${lab_user.id}`"
          as="button"
          method="delete"
          class="mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium"
        >
          Destroy this lab user
        </Link>
      </div>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import LabUser from './LabUser.vue'

const { lab_user, flash } = defineProps(['lab_user', 'flash'])
</script>
