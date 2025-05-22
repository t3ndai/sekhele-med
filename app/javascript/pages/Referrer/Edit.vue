<template>
  <Head title="Editing referrer" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">Editing referrer</h1>

    <Form
      :referrer="referrer"
      submitText="Update Referrer"
      @onSubmit="handleSubmit"
    />

    <Link
      :href="`/referrers/${referrer.id}`"
      class="mt-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Show this referrer
    </Link>
    <Link
      href="/referrers"
      class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Back to referrers
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { referrer } = defineProps(['referrer'])

const handleSubmit = (form) => {
  form.transform((data) => ({ referrer: data }))
  form.patch(`/referrers/${referrer.id}`)
}
</script>
