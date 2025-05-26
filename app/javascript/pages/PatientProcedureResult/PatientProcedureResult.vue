<template>
  <div>
    <p class="my-5">
      <strong class="block font-medium mb-1">Notes:</strong>
      {{ patient_procedure_result.notes }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Images:</strong>
    </p>
    <div v-for="file in patient_procedure_result.images">
      <a :href="file.url">{{ file.filename }}</a>
    </div>
    <p class="my-5">
      <strong class="block font-medium mb-1">Assignee:</strong>
      {{ assignee }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Patient procedure:</strong>
      {{ procedure }}
    </p>
  </div>
</template>

<script setup>
const { patient_procedure_result, assignee, procedure } = defineProps(['patient_procedure_result', 'assignee', 'procedure'])
</script>
