<template>
  <form @submit.prevent="emit('onSubmit', form)" class="contents">
    <div class="my-5">
      <label for="name">Name</label>
      <input type="text" name="name" id="name" v-model="form.name" required
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.name" :class="$style.error">
        {{ form.errors.name.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="code">Code<span class="text-shadow-gray-400 text-sm ml-2">(Billing Code)</span></label>
      <input type="text" name="code" id="code" v-model="form.code" required
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.code" :class="$style.error">
        {{ form.errors.code.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="cost">Cost</label>
      <input type="number" name="cost" id="cost" v-model="form.cost" required
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full" />
      <div v-if="form.errors.cost" :class="$style.error">
        {{ form.errors.cost.join(', ') }}
      </div>
    </div>


    <div class="inline">
      <button type="submit" :disabled="form.processing"
        class="rounded-lg py-3 px-5 bg-blue-600 text-white inline-block font-medium cursor-pointer">
        {{ submitText }}
      </button>
    </div>
  </form>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3'

const { procedure, submitText } = defineProps(['procedure', 'submitText'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  name: procedure.name || '',
  code: procedure.code || '',
  cost: procedure.cost || '',
  lab_branch_id: procedure.lab_branch_id || '',
})
</script>

<style module>
.label {
  display: block;
}

.error {
  color: red;
}
</style>
