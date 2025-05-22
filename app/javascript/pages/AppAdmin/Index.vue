<template>
    <h1 class="font-bold text-4xl">AppAdmin#index</h1>
    <p>Find me in app/javascript/pages/AppAdmin/Index.vue</p>

    <div class="flex justify-between items-center">
        <h1 class="font-bold text-4xl">Labs</h1>
        <Link
            href="/app_admin/labs/new"
            class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium"
        >
            New lab
        </Link>
    </div>
</template>

<script setup>
import { Link } from "@inertiajs/vue3";
</script>
