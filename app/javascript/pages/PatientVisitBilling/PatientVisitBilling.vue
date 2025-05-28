<template>
  <div>
    <p class="my-5">
      <strong class="block font-medium mb-1">Amount due:</strong>
      {{ patient_visit_billing.amount_due }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Amount paid:</strong>
      {{ patient_visit_billing.amount_paid }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Status:</strong>
      {{ patient_visit_billing.status }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Proof:</strong>
    </p>
    <div v-for="file in patient_visit_billing.proof">
      <a :href="file.url">{{ file.filename }}</a>
    </div>
    <p class="my-5">
      <strong class="block font-medium mb-1">Payment method:</strong>
      {{ patient_visit_billing.payment_method }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Patient visit:</strong>
      {{ patient_visit_billing.patient_visit_id }}
    </p>
  </div>
</template>

<script setup>
const { patient_visit_billing } = defineProps(['patient_visit_billing'])
</script>
