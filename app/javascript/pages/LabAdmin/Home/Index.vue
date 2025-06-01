<template>
    <div class="lab-admin-home">
        <h1>Administration</h1>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Welcome to Administration</h5>
                        <p class="card-text">
                            Manage your Branches, users, and settings from this dashboard.
                        </p>
                    </div>
                </div>
            </div>
        </div>


        <div class="flex flex-col mt-4">
            <div class="flex justify-between items-center">
                <h1 class="font-bold text-4xl">Branches</h1>
                <Link href="/lab_admin/lab_branches/new"
                    class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium">
                New Branch
                </Link>
            </div>
            <div>
                <DataTable :value="branches" responsiveLayout="scroll">
                    <Column field="name" header="Name"></Column>
                    <Column field="visits" header="Visits"></Column>
                    <Column field="receipts" header="Receipts Today $"></Column>
                    <Column field="actions" header="Actions">
                        <template #body="slotProps">
                            <Link :href="`/lab_admin/lab_branches/${slotProps.data.id}`"
                                class="rounded-lg py-3 px-5 bg-gray-400 text-white block font-medium">View</Link>
                        </template>
                    </Column>
                </DataTable>
            </div>
        </div>

        <div class="flex flex-col mt-8">
            <div class="flex justify-between items-center">
                <h1 class="font-bold text-4xl">Referrers</h1>
            </div>
            <div>
                <DataTable :value="referrers" responsiveLayout="scroll">
                    <Column field="name" header="Name"></Column>
                    <Column field="this_month" header="This Month Referrals"></Column>
                    <Column field="all_time" header="All Time Refferals"></Column>
                    <Column field="actions" header="Actions">
                        <template #body="slotProps">
                            <Link :href="`/lab_admin/lab_users/${slotProps.data.id}`"
                                class="rounded-lg py-3 px-5 bg-gray-400 text-white block font-medium">View</Link>
                        </template>
                    </Column>
                </DataTable>
            </div>
        </div>
    </div>
</template>


<script setup>
import { Link } from '@inertiajs/vue3';
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';

defineProps({
    lab_id: {
        type: Number,
        required: true
    },
    branches: {
        type: Array,
        required: true
    },
    referrers: {
        type: Array,
        required: true
    }
})



</script>


<style scoped></style>