<template>
  <Head title="Editing procedure" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">Editing procedure</h1>

    <Form
      :procedure="procedure"
      submitText="Update Procedure"
      @onSubmit="handleSubmit"
    />

    <Link
      :href="`/procedures/${procedure.id}`"
      class="mt-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Show this procedure
    </Link>
    <Link
      href="/procedures"
      class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Back to procedures
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { procedure } = defineProps(['procedure'])

const handleSubmit = (form) => {
  form.transform((data) => ({ procedure: data }))
  form.patch(`/procedures/${procedure.id}`)
}
</script>
