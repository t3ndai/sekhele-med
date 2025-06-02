<template>
  <form @submit.prevent="emit('onSubmit', form)" class="contents">

    <div class="my-5">
      <fieldset>
        <legend>Visit Type:</legend>

        <div>
          <input type="radio" id="referral" name="Referral" value="referral" v-model="form.visit_type" />
          <label for="referral">Referral (Known Referrer)</label>
        </div>

        <div>
          <input type="radio" id="walk_in" name="walk_in" value="walk_in" v-model="form.visit_type" />
          <label for="walk_in">Walk In (New Referrer)</label>
        </div>
      </fieldset>
      <div v-if="form.errors.visit_type" :class="$style.error">
        {{ form.errors.visit_type.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="referrer">Referrer</label>
      <Select :options="referrers" optionValue="id" optionLabel="name" name="referrer" id="referrer"
        v-model="form.referrer_id"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.referrer_id" :class="$style.error">
        {{ form.errors.referrer_id.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="allergy">Allergies</label>
      <textarea name="allergy" id="allergy" v-model="form.allergies"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.allergies" :class="$style.error">
        {{ form.errors.allergies.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="medicine">Medicines</label>
      <textarea name="medicine" id="medicine" v-model="form.medicines"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.medicines" :class="$style.error">
        {{ form.errors.medicines.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="vital">Vitals</label>
      <textarea name="vital" id="vital" v-model="form.vitals"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.vitals" :class="$style.error">
        {{ form.errors.vitals.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="request_pad">Request pad</label>
      <input type="file" name="request_pad" id="request_pad" @input="form.request_pad = $event.target.files[0]"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.request_pad" :class="$style.error">
        {{ form.errors.request_pad.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="doc">Docs</label>
      <input type="file" :multiple="true" name="doc[]" id="doc" @input="form.docs = $event.target.files"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.docs" :class="$style.error">
        {{ form.errors.docs.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="visit_time">Visit time</label>
      <input type="time" name="visit_time" id="visit_time" v-model="form.visit_time"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.visit_time" :class="$style.error">
        {{ form.errors.visit_time.join(', ') }}
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
import { Select } from 'primevue'

const { patient_visit, submitText, referrers } = defineProps(['patient_visit', 'submitText', 'referrers'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  referrer_id: patient_visit.referrer_id || '',
  visit_type: patient_visit.visit_type || '',
  allergies: patient_visit.allergies || '',
  medicines: patient_visit.medicines || '',
  vitals: patient_visit.vitals || '',
  request_pad: patient_visit.request_pad || '',
  docs: patient_visit.docs || '',
  visit_time: patient_visit.visit_time || '',
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
