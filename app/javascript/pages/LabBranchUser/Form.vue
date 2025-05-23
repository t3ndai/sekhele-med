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
      <label for="last_name">Last names</label>
      <input type="text" name="last_name" id="last_name" v-model="form.last_names"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.last_names" :class="$style.error">
        {{ form.errors.last_names.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="role_type">Role type</label>
      <Select :options="roleTypes" optionLabel="label" optionValue="value" type="text" name="role_type" id="role_type"
        v-model="form.role_type" placeholder="Select a role type"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.role_type" :class="$style.error">
        {{ form.errors.role_type.join(', ') }}
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
      <label for="email">Email</label>
      <input type="text" name="email" id="email" v-model="form.email"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.email" :class="$style.error">
        {{ form.errors.email.join(', ') }}
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
      <label for="document">Documents</label>
      <input type="file" multiple name="document[]" id="document"
        @input="form.documents = Array.from($event.target.files)"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.documents" :class="$style.error">
        {{ form.errors.documents.join(', ') }}
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
import { ref } from 'vue'
import { useForm } from '@inertiajs/vue3'
import Select from 'primevue/select';


const { lab_branch_user, submitText } = defineProps(['lab_branch_user', 'submitText'])
const emit = defineEmits(['onSubmit'])

const roleTypes = ref([
  { label: 'Front Office', value: 'front_office' },
  { label: 'Medical', value: 'medical' },
])

const form = useForm({
  first_name: lab_branch_user.first_name || '',
  middle_names: lab_branch_user.middle_names || '',
  last_names: lab_branch_user.last_names || '',
  role_type: lab_branch_user.role_type || '',
  phone: lab_branch_user.phone || '',
  email: lab_branch_user.email || '',
  address: lab_branch_user.address || '',
  documents: lab_branch_user.documents || '',
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
