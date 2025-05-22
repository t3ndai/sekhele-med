<template>
  <form @submit.prevent="emit('onSubmit', form)" class="contents">
    <div class="my-5">
      <label for="first_name">First name</label>
      <input type="text" name="first_name" id="first_name" v-model="form.first_name"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.first_name" :class="$style.error">
        {{ form.errors.first_name.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="middle_name">Middle names</label>
      <input type="text" name="middle_name" id="middle_name" v-model="form.middle_names"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.middle_names" :class="$style.error">
        {{ form.errors.middle_names.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="last_name">Last name</label>
      <input type="text" name="last_name" id="last_name" v-model="form.last_name"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.last_name" :class="$style.error">
        {{ form.errors.last_name.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="dob">Dob</label>
      <input type="date" name="dob" id="dob" v-model="form.dob"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.dob" :class="$style.error">
        {{ form.errors.dob.join(', ') }}
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

    <div class="my-5">
      <label for="emergency_contact">Emergency contact Name</label>
      <input type="text" name="emergency_contact" id="emergency_contact" v-model="form.emergency_contact.name"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.emergency_contact" :class="$style.error">
        {{ form.errors.emergency_contact.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="emergency_contact">Emergency contact Phone</label>
      <input type="text" name="emergency_contact" id="emergency_contact" v-model="form.emergency_contact.phone"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.emergency_contact" :class="$style.error">
        {{ form.errors.emergency_contact.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="emergency_contact">Emergency contact Relationship</label>
      <input type="text" name="emergency_contact" id="emergency_contact" v-model="form.emergency_contact.relationship"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.emergency_contact" :class="$style.error">
        {{ form.errors.emergency_contact.join(', ') }}
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

const { patient, submitText } = defineProps(['patient', 'submitText'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  first_name: patient.first_name || '',
  middle_names: patient.middle_names || '',
  last_name: patient.last_name || '',
  dob: patient.dob || '',
  address: patient.address || '',
  email: patient.email || '',
  phone: patient.phone || '',
  lab_branch_id: patient.lab_branch_id || '',
  emergency_contact: patient.emergency_contact || {},
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
