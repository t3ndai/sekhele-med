<template>

  <Head :title="`Lab branch #${lab_branch.id}`" />

  <div className="mx-auto m-w-screen w-full px-8 pt-8">
    <div class="mx-auto">
      <p v-if="flash.notice" class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block">
        {{ flash.notice }}
      </p>

      <h1 class="font-bold text-4xl">Branch {{ lab_branch.name }}</h1>

      <div class="flex justify-between items-center my-2">
        <div class="flex justify-between items-center">
          <Link :href="`/lab_branches/${lab_branch.id}/referrers/new`"
            class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium">
          New referrer
          </Link>
        </div>

        <div class="flex justify-between items-center">
          <Link :href="`/lab_branches/${lab_branch.id}/procedures/new`"
            class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium">
          New procedure
          </Link>
        </div>

        <div class="flex justify-between items-center">
          <Link :href="`/lab_branches/${lab_branch.id}/patients/new`"
            class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium">
          New patient
          </Link>
        </div>
      </div>

      <div class="flex justify-between items-center">
        <div class="flex justify-between items-center">
          <Link :href="`/lab_branches/${lab_branch.id}/referrers`"
            class="rounded-lg py-3 px-5 bg-slate-400 text-white block font-medium">
          View Referrers
          </Link>
        </div>
        <div class="flex justify-between items-center">
          <Link :href="`/lab_branches/${lab_branch.id}/procedures`"
            class="rounded-lg py-3 px-5 bg-slate-400 text-white block font-medium">
          View Procedures
          </Link>
        </div>
        <div class="flex justify-between items-center">
          <Link :href="`/lab_branches/${lab_branch.id}/patients`"
            class="rounded-lg py-3 px-5 bg-slate-400 text-white block font-medium">
          View Patients
          </Link>
        </div>
      </div>

      <div class="min-w-full">
        <template v-for="referrer in lab_branch.referrers" :key="referrer.id">
          <Referrer :referrer="referrer" />
          <p>
            <Link :href="`/referrers/${referrer.id}`"
              class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
            Show this referrer
            </Link>
          </p>
        </template>

        <div class="min-w-full">
          <template v-for="procedure in lab_branch.procedures" :key="procedure.id">
            <Procedure :procedure="procedure" />
            <p>
              <Link :href="`/procedures/${procedure.id}`"
                class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium">
              Show this procedure
              </Link>
            </p>
          </template>
        </div>

      </div>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from "@inertiajs/vue3";
import LabBranch from "./LabBranch.vue";

const { lab_branch, flash } = defineProps(["lab_branch", "flash"]);
</script>
