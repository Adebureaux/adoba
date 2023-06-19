<template>
  <div class="row justify-evenly no-wrap">
    <q-item>
      <q-item-section>
        <img class="interpolate-img" :src="logo">
      </q-item-section>
    </q-item>
    <q-item>
      <q-item-section class="interpolate-font">
        <span><span class="number">{{establishment_number}}</span>
        établissement<span v-if="establishment_number > 1">s</span></span>
      </q-item-section>
    </q-item>
    <q-item>
      <q-item-section class="interpolate-font">
        <span><span class="number">{{actions}}</span>
        action<span v-if="actions > 1">s</span></span>
      </q-item-section>
    </q-item>
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
@use "src/css/interpolate" as r

.interpolate-img
  @include r.interpolate(width, 320px, 2560px, 50px, 150px)
  border-radius: 25%

.number
  @include r.interpolate(font-size, 320px, 2560px, 20px, 60px)
  font-weight: bold
  color: $primary

</style>
