<template>
  <Head title="Editing lab" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">Editing lab</h1>

    <Form
      :lab="lab"
      submitText="Update Lab"
      @onSubmit="handleSubmit"
    />

    <Link
      :href="`/labs/${lab.id}`"
      class="mt-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Show this lab
    </Link>
    <Link
      href="/labs"
      class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Back to labs
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { lab } = defineProps(['lab'])

const handleSubmit = (form) => {
  form.transform((data) => ({ lab: data }))
  form.patch(`/labs/${lab.id}`)
}
</script>
