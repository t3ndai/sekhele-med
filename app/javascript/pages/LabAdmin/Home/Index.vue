<template>
    <div class="lab-admin-home">
        <h1>Lab Administration</h1>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Welcome to Lab Administration</h5>
                        <p class="card-text">
                            Manage your lab resources, users, and settings from this dashboard.
                        </p>
                    </div>
                </div>
            </div>
        </div>


        <div class="flex justify-between items-center">
            <h1 class="font-bold text-4xl">Lab branches</h1>
            <Link :href="`/lab_admin/labs/${lab_id}/lab_branches/new`"
                class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium">
            New lab branch
            </Link>
        </div>
    </div>
</template>


<script setup>
import { Link } from '@inertiajs/vue3';

defineProps({
    lab_id: {
        type: Number,
        required: true
    },
})



</script>


<style scoped></style>