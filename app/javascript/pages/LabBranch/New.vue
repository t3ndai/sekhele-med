<template>

  <Head title="New lab branch" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">New lab branch</h1>

    <Form :lab_branch="lab_branch" submitText="Create Lab branch" @onSubmit="handleSubmit" />

    <Link href="/lab_branches" class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
    Back to lab branches
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { lab_branch, lab_id } = defineProps(['lab_branch', 'lab_id'])

const handleSubmit = (form) => {
  form.transform((data) => ({ lab_branch: data }))
  form.post(`/lab_admin/labs/${lab_id}/lab_branches`)
}
</script>
