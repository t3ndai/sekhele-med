<template>
  <Head title="Referrers" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <p
      v-if="flash.notice"
      class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block"
    >
      {{ flash.notice }}
    </p>

    <div class="flex justify-between items-center">
      <h1 class="font-bold text-4xl">Referrers</h1>
      <Link
        href="/referrers/new"
        class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium"
      >
        New referrer
      </Link>
    </div>

    <div class="min-w-full">
      <template v-for="referrer in referrers" :key="referrer.id">
        <Referrer :referrer="referrer" />
        <p>
          <Link
            :href="`/referrers/${referrer.id}`"
            class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
          >
            Show this referrer
          </Link>
        </p>
      </template>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Referrer from './Referrer.vue'

const { referrers, flash } = defineProps(['referrers', 'flash'])
</script>
