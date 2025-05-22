<template>
  <div>
    <p class="my-5">
      <strong class="block font-medium mb-1">Name:</strong>
      {{ lab_user.name }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Email:</strong>
      {{ lab_user.email }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Username:</strong>
      {{ lab_user.username }}
    </p>
  </div>
</template>

<script setup>
const { lab_user } = defineProps(['lab_user'])
</script>
