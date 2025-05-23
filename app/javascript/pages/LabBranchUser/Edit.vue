<template>
  <Head title="Editing lab branch user" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">Editing lab branch user</h1>

    <Form
      :lab_branch_user="lab_branch_user"
      submitText="Update Lab branch user"
      @onSubmit="handleSubmit"
    />

    <Link
      :href="`/lab_branch_users/${lab_branch_user.id}`"
      class="mt-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Show this lab branch user
    </Link>
    <Link
      href="/lab_branch_users"
      class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Back to lab branch users
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { lab_branch_user } = defineProps(['lab_branch_user'])

const handleSubmit = (form) => {
  form.transform((data) => ({ lab_branch_user: data }))
  form.post(`/lab_branch_users/${lab_branch_user.id}`, {
    headers: { 'X-HTTP-METHOD-OVERRIDE': 'put' },
  })
}
</script>
