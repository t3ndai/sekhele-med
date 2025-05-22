<template>
  <div>
    <p class="my-5">
      <strong class="block font-medium mb-1">Company name:</strong>
      {{ lab.company_name }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Trading name:</strong>
      {{ lab.trading_name }}
    </p>
  </div>
</template>

<script setup>
const { lab } = defineProps(['lab'])
</script>
