<template>
  <form @submit.prevent="emit('onSubmit', form)" class="contents">

    <div class="my-5">
      <label for="name">Name</label>
      <input type="text" name="name" id="name" v-model="form.name"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.name" :class="$style.error">
        {{ form.errors.name.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="address">Address</label>
      <textarea name="address" id="address" v-model="form.address" rows="4"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.address" :class="$style.error">
        {{ form.errors.address.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="email">Email</label>
      <input type="text" name="email" id="email" v-model="form.email"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.email" :class="$style.error">
        {{ form.errors.email.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="phone">Phone</label>
      <input type="text" name="phone" id="phone" v-model="form.phone"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.phone" :class="$style.error">
        {{ form.errors.phone.join(', ') }}
      </div>
    </div>

    <div class="inline">
      <button type="submit" :disabled="form.processing"
        class="rounded-lg py-3 px-5 bg-blue-600 text-white inline-block font-medium cursor-pointer">
        {{ submitText }}
      </button>
    </div>
  </form>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3'

const { referrer, submitText } = defineProps(['referrer', 'submitText'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  lab_branch_id: referrer.lab_branch_id || '',
  share_code: referrer.share_code || '',
  name: referrer.name || '',
  address: referrer.address || '',
  email: referrer.email || '',
  phone: referrer.phone || '',
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
