<template>
  <div>
    <p class="my-5">
      <strong class="block font-medium mb-1">Referrer:</strong>
      {{ referrer }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Visit type:</strong>
      {{ patient_visit.visit_type }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Allergies:</strong>
      {{ patient_visit.allergies }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Medicines:</strong>
      {{ patient_visit.medicines }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Vitals:</strong>
      {{ patient_visit.vitals }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Request pad:</strong>
      <a v-if="patient_visit.request_pad" :href="patient_visit.request_pad.url">
        {{ patient_visit.request_pad.filename }}
      </a>
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Docs:</strong>
    </p>
    <div v-for="file in patient_visit.docs">
      <a :href="file.url">{{ file.filename }}</a>
    </div>
    <p class="my-5">
      <strong class="block font-medium mb-1">Visit time:</strong>
      {{ patient_visit.visit_time }}
    </p>
  </div>
</template>

<script setup>
const { patient_visit, referrer } = defineProps(['patient_visit', 'referrer'])
</script>
