<template>
  <Head :title="`Procedure #${procedure.id}`" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <div class="mx-auto">
      <p
        v-if="flash.notice"
        class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block"
      >
        {{ flash.notice }}
      </p>

      <h1 class="font-bold text-4xl">Procedure #{{ procedure.id }}</h1>

      <Procedure :procedure="procedure" />

      <Link
        :href="`/procedures/${procedure.id}/edit`"
        class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
      >
        Edit this procedure
      </Link>
      <Link
        href="/procedures"
        class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
      >
        Back to procedures
      </Link>

      <div class="inline-block ml-2">
        <Link
          :href="`/procedures/${procedure.id}`"
          as="button"
          method="delete"
          class="mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium"
        >
          Destroy this procedure
        </Link>
      </div>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Procedure from './Procedure.vue'

const { procedure, flash } = defineProps(['procedure', 'flash'])
</script>
