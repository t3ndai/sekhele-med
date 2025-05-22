<template>
  <form @submit.prevent="emit('onSubmit', form)" class="contents">
    <div class="my-5">
      <label for="name">Name</label>
      <input
        type="text"
        name="name"
        id="name"
        v-model="form.name"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full"
      />
      <div v-if="form.errors.name" :class="$style.error">
        {{ form.errors.name.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="email">Email</label>
      <input
        type="text"
        name="email"
        id="email"
        v-model="form.email"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full"
      />
      <div v-if="form.errors.email" :class="$style.error">
        {{ form.errors.email.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="username">Username</label>
      <input
        type="text"
        name="username"
        id="username"
        v-model="form.username"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full"
      />
      <div v-if="form.errors.username" :class="$style.error">
        {{ form.errors.username.join(', ') }}
      </div>
    </div>

    <div class="inline">
      <button
        type="submit"
        :disabled="form.processing"
        class="rounded-lg py-3 px-5 bg-blue-600 text-white inline-block font-medium cursor-pointer"
      >
        {{ submitText }}
      </button>
    </div>
  </form>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3'

const { lab_user, submitText } = defineProps(['lab_user', 'submitText'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  name: lab_user.name || '',
  email: lab_user.email || '',
  username: lab_user.username || '',
})
</script>

<style module>
.label {
  display: block;
}
.error {
  color: red;
}
</style>
