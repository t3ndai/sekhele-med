<template>

  <Head title="New procedure" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">New procedure</h1>

    <Form :procedure="procedure" submitText="Create Procedure" @onSubmit="handleSubmit" />

    <Link href="/procedures" class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
    Back to procedures
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { procedure, lab_branch_id } = defineProps(['procedure', 'lab_branch_id'])

const handleSubmit = (form) => {
  form.transform((data) => ({ procedure: data }))
  form.post(`/lab_branches/${lab_branch_id}/procedures`)
}
</script>
