<template>
  <div>
    <p class="my-5">
      <strong class="block font-medium mb-1">Name:</strong>
      {{ lab_branch.name }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Lab:</strong>
      {{ lab_branch.lab_id }}
    </p>
  </div>
</template>

<script setup>
const { lab_branch } = defineProps(['lab_branch'])
</script>
