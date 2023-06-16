<template>
  <div>
    <div>
    <img :src="logo">
      <span class="absolute-center">Lorem</span>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
  name: 'OrganizationOverview',
  props: {
    logo:                  { type: String, required: true },
    establishment_number:  { type: Number, default: 1 },
    actions:               { type: Number, default: 0 }
  }
})
</script>

<style lang="sass" scoped>
img
  border-radius: 25%
  width: 80px

</style>
