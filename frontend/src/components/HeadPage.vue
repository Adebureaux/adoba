<template>
  <q-item class="head-container q-pa-xl">
    <div class="q-mr-lg">
      <q-icon
        class="full-height"
        color="grey-7"
        :name="mdiViewDashboardOutline"
        size="20px"
      />
    </div>
    <div class="location-container">
      <span class="text-grey-7" style="font-size: 18px;">
        <q-btn flat no-caps to="/">Dashboard</q-btn>
        <span v-if="location !== ''">
          <span class="gt-sm"> / </span><q-btn flat no-caps>{{ location }}</q-btn>
        </span>
      </span>
    </div>
    <q-space />
    <div>
      <q-btn
      class="full-height"
        color="primary"
        flat
        :icon="mdiBell"
      />
    </div>
    <div>
      <q-avatar size="50px" class="q-ml-lg" color="primary">
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
    location: { type: String, default: '' }
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
  },
  methods: {
    goHome() {
      this.$router.push({
        path: '/',
      })
    }
  }
})
</script>

<style lang="sass" scoped>
.head-container
  display: flex
  align-items: center

.location-container
  flex-grow: 1

@media screen and (max-width: 800px)
  .separator
    display: none

</style>
