<template>
    <Head :title="`Lab #${lab.id}`" />

    <div className="flex mx-auto w-full px-8 pt-8">
        <div class="mx-auto">
            <p
                v-if="flash.notice"
                class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block"
            >
                {{ flash.notice }}
            </p>

            <h1 class="font-bold text-4xl">Lab #{{ lab.id }}</h1>

            <Lab :lab="lab" />

            <Link
                :href="`/labs/${lab.id}/edit`"
                class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
            >
                Edit this lab
            </Link>
            <Link
                href="/labs"
                class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
            >
                Back to labs
            </Link>

            <div class="inline-block ml-2">
                <Link
                    :href="`/labs/${lab.id}`"
                    as="button"
                    method="delete"
                    class="mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium"
                >
                    Destroy this lab
                </Link>
            </div>

            <div class="flex justify-between items-center">
                <h1 class="font-bold text-4xl">Lab users</h1>
                <Link
                    :href="`/app_admin/labs/${lab.id}/lab_users/new`"
                    class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium"
                >
                    New lab user
                </Link>
            </div>
        </div>
    </div>
</template>

<script setup>
import { Head, Link } from "@inertiajs/vue3";
import Lab from "./Lab.vue";

const { lab, flash } = defineProps(["lab", "flash"]);
</script>
