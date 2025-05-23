<template>

  <Head title="New lab branch user" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">New lab branch user</h1>

    <Form :lab_branch_user="lab_branch_user" submitText="Create Lab branch user" @onSubmit="handleSubmit" />

    <Link href="/lab_branch_users" class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
    Back to lab branch users
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { lab_branch_user, lab_branch_id } = defineProps(['lab_branch_user', 'lab_branch_id'])

const handleSubmit = (form) => {
  form.transform((data) => ({ lab_branch_user: data }))
  form.post(`/lab_admin/lab_branches/${lab_branch_id}/lab_branch_users`)
}
</script>
