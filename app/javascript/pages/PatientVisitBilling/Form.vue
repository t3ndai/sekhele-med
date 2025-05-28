<template>
  <form @submit.prevent="emit('onSubmit', form)" class="contents">
    <div class="my-5">
      <label for="amount_due">Amount due</label>
      <input
        type="number"
        name="amount_due"
        id="amount_due"
        v-model="form.amount_due"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full"
      />
      <div v-if="form.errors.amount_due" :class="$style.error">
        {{ form.errors.amount_due.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="amount_paid">Amount paid</label>
      <input
        type="number"
        name="amount_paid"
        id="amount_paid"
        v-model="form.amount_paid"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full"
      />
      <div v-if="form.errors.amount_paid" :class="$style.error">
        {{ form.errors.amount_paid.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="status">Status</label>
      <input
        type="text"
        name="status"
        id="status"
        v-model="form.status"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full"
      />
      <div v-if="form.errors.status" :class="$style.error">
        {{ form.errors.status.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="proof">Proof</label>
      <input
        type="file"
        multiple
        name="proof[]"
        id="proof"
        @input="form.proof = Array.from($event.target.files)"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full"
      />
      <div v-if="form.errors.proof" :class="$style.error">
        {{ form.errors.proof.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="payment_method">Payment method</label>
      <input
        type="text"
        name="payment_method"
        id="payment_method"
        v-model="form.payment_method"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full"
      />
      <div v-if="form.errors.payment_method" :class="$style.error">
        {{ form.errors.payment_method.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="patient_visit">Patient visit</label>
      <input
        type="text"
        name="patient_visit"
        id="patient_visit"
        v-model="form.patient_visit_id"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full"
      />
      <div v-if="form.errors.patient_visit_id" :class="$style.error">
        {{ form.errors.patient_visit_id.join(', ') }}
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

const { patient_visit_billing, submitText } = defineProps(['patient_visit_billing', 'submitText'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  amount_due: patient_visit_billing.amount_due || '',
  amount_paid: patient_visit_billing.amount_paid || '',
  status: patient_visit_billing.status || '',
  proof: patient_visit_billing.proof || '',
  payment_method: patient_visit_billing.payment_method || '',
  patient_visit_id: patient_visit_billing.patient_visit_id || '',
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
