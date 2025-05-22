<template>
  <div>
    <p class="my-5">
      <strong class="block font-medium mb-1">First name:</strong>
      {{ patient.first_name }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Middle names:</strong>
      {{ patient.middle_names }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Last name:</strong>
      {{ patient.last_name }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Dob:</strong>
      {{ patient.dob }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Address:</strong>
      {{ patient.address }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Email:</strong>
      {{ patient.email }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Phone:</strong>
      {{ patient.phone }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Lab branch:</strong>
      {{ patient.lab_branch_id }}
    </p>
    <div class="my-5">
      <strong class="block font-medium mb-1">Emergency contact:</strong>
      <p v-for="(v, k) in patient.emergency_contact" :key="k" class="flex gap-x-2">
        <strong class="block font-medium mb-1">{{ k }}:</strong>
        {{ v }}
      </p>
    </div>
  </div>
</template>

<script setup>
const { patient } = defineProps(['patient'])
</script>
