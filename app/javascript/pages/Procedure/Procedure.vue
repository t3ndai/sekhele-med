<template>
  <div>
    <p class="my-5">
      <strong class="block font-medium mb-1">Name:</strong>
      {{ procedure.name }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Code:</strong>
      {{ procedure.code }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Cost:</strong>
      {{ procedure.cost }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Lab branch:</strong>
      {{ procedure.lab_branch_id }}
    </p>
  </div>
</template>

<script setup>
const { procedure } = defineProps(['procedure'])
</script>
