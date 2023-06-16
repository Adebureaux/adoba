<template>
  <q-item class="q-pa-xl">
    <div class="q-mr-lg">
      <q-icon class="interpolate-font full-height" color="grey-7" :name="mdiViewDashboardOutline"/>
    </div>
    <div>
      <span class="interpolate-font text-grey-7">{{location}}</span>
    </div>
  </q-item>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import { mdiViewDashboardOutline } from '@quasar/extras/mdi-v6';

export default defineComponent({
  name: 'HeadPage',
  props: {
    location: { type: String, default: 'Dashboard' }
  },
  setup() {
    return {
      mdiViewDashboardOutline: ''
    }
  },
  created() {
    this.mdiViewDashboardOutline = mdiViewDashboardOutline
  }
})
</script>

<style lang="sass" scoped>
</style>
