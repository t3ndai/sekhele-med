<template>

  <Head title="New referrer" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">New referrer</h1>

    <Form :referrer="referrer" submitText="Create Referrer" @onSubmit="handleSubmit" />

    <Link href="/referrers" class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
    Back to referrers
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { referrer, lab_branch_id } = defineProps(['referrer', 'lab_branch_id'])

const handleSubmit = (form) => {
  form.transform((data) => ({ referrer: data }))
  form.post(`/lab_branches/${lab_branch_id}/referrers`)
}
</script>
