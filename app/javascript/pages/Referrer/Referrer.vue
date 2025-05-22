<template>
  <div>
    <p class="my-5">
      <strong class="block font-medium mb-1">Lab branch:</strong>
      {{ referrer.lab_branch_id }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Share code:</strong>
      {{ referrer.share_code }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Name:</strong>
      {{ referrer.name }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Address:</strong>
      {{ referrer.address }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Email:</strong>
      {{ referrer.email }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Phone:</strong>
      {{ referrer.phone }}
    </p>
  </div>
</template>

<script setup>
const { referrer } = defineProps(['referrer'])
</script>
