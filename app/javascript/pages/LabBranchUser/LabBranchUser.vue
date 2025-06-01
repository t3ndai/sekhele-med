<template>
  <div>
    <p class="my-5">
      <strong class="block font-medium mb-1">First name:</strong>
      {{ lab_branch_user.first_name }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Middle names:</strong>
      {{ lab_branch_user.middle_names }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Last names:</strong>
      {{ lab_branch_user.last_names }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Role type:</strong>
      {{ lab_branch_user.role_type }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Phone:</strong>
      {{ lab_branch_user.phone }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Email:</strong>
      {{ lab_branch_user.email }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Address:</strong>
      {{ lab_branch_user.address }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Documents:</strong>
    </p>
    <div v-for="file in lab_branch_user.documents">
      <a :href="file.url">{{ file.filename }}</a>
    </div>
  </div>
</template>

<script setup>
const { lab_branch_user } = defineProps(['lab_branch_user'])
</script>
