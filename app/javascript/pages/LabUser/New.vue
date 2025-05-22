<template>
  <Head title="New lab user" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">New lab user</h1>

    <Form
      :lab_user="lab_user"
      submitText="Create Lab user"
      @onSubmit="handleSubmit"
    />

    <Link
      href="/lab_users"
      class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Back to lab users
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { lab_user } = defineProps(['lab_user'])

const handleSubmit = (form) => {
  form.transform((data) => ({ lab_user: data }))
  form.post('/lab_users')
}
</script>
