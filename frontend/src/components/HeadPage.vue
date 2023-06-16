<template>
  <q-item class="head-container q-pa-xl">
    <div class="q-mr-lg">
      <q-icon
        class=" full-height"
        color="grey-7"
        :name="mdiViewDashboardOutline"
        size="20px"
      />
    </div>
    <div class="location-container">
      <span class=" text-grey-7" style="font-size: 18px;">{{location}}</span>
    </div>
    <q-space />
    <div>
      <q-btn
        color="primary"
        flat
        :icon="mdiBell"
      />
    </div>
    <div>
      <q-avatar class="q-ml-lg" color="primary">
        <q-img src="head-logo.png"></q-img>
      </q-avatar>
    </div>
  </q-item>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import { mdiViewDashboardOutline, mdiBell } from '@quasar/extras/mdi-v6';

export default defineComponent({
  name: 'HeadPage',
  props: {
    location: { type: String, default: 'Dashboard' }
  },
  setup() {
    return {
      mdiViewDashboardOutline: '',
      mdiBell: '',
    }
  },
  created() {
    this.mdiViewDashboardOutline = mdiViewDashboardOutline
    this.mdiBell = mdiBell
  }
})
</script>

<style lang="sass" scoped>
.head-container
  display: flex
  align-items: center

.location-container
  flex-grow: 1

</style>
