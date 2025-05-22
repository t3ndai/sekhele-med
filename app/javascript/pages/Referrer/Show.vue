<template>
  <Head :title="`Referrer #${referrer.id}`" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <div class="mx-auto">
      <p
        v-if="flash.notice"
        class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block"
      >
        {{ flash.notice }}
      </p>

      <h1 class="font-bold text-4xl">Referrer #{{ referrer.id }}</h1>

      <Referrer :referrer="referrer" />

      <Link
        :href="`/referrers/${referrer.id}/edit`"
        class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
      >
        Edit this referrer
      </Link>
      <Link
        href="/referrers"
        class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
      >
        Back to referrers
      </Link>

      <div class="inline-block ml-2">
        <Link
          :href="`/referrers/${referrer.id}`"
          as="button"
          method="delete"
          class="mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium"
        >
          Destroy this referrer
        </Link>
      </div>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Referrer from './Referrer.vue'

const { referrer, flash } = defineProps(['referrer', 'flash'])
</script>
