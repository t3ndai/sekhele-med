<template>

  <Head title="New lab branch" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">New Branch</h1>

    <Form :lab_branch="lab_branch" submitText="Create Branch" @onSubmit="handleSubmit" />

    <Link href="/lab_admin" class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
    Back to Admin Dashboard
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { lab_branch, lab_id } = defineProps(['lab_branch', 'lab_id'])

const handleSubmit = (form) => {
  form.transform((data) => ({ lab_branch: data }))
  form.post(`/lab_admin/lab_branches`)
}
</script>
