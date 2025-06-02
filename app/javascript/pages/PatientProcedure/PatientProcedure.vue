<template>
  <div class="flex justify-between items-center">
    <p class="my-5">
      <strong class="block font-medium mb-1">Procedure:</strong>
      {{ procedure }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Assignee:</strong>
      {{ assignee }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Procedure on:</strong>
      {{ patient_procedure.procedure_on }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Procedure at:</strong>
      {{ patient_procedure.procedure_at }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Patient visit:</strong>
      {{ patient_procedure.patient_visit_id }}
    </p>
  </div>
</template>

<script setup>
const { patient_procedure, assignee, procedure } = defineProps(['patient_procedure', 'assignee', 'procedure'])
</script>
