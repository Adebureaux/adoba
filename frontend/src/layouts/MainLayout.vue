<template>
  <q-layout view="lHh Lpr lFf">
    <q-drawer
      v-model="drawer"
      show-if-above
      :width=250
      :breakpoint=425
      bordered
    >
      <q-btn
        align="left"
        class="padding-top q-pl-xl full-width q-ma-sm row"
        size="20px"
        :icon="mdiViewDashboardOutline"
        flat
        label="Actualités"
        no-caps
      />
      <q-btn
        align="left"
        class="q-pl-xl full-width q-ma-sm row"
        size="20px"
        :icon="mdiCheckboxMarkedCirclePlusOutline"
        flat
        label="Actions"
        no-caps
      />
      <q-btn
        align="left"
        class="q-pl-xl full-width q-ma-sm row"
        :icon="mdiNoteTextOutline"
        size="20px"
        flat
        label="Declarations"
        no-caps
        no-wrap
      />
      <q-btn
        align="left"
        class="q-pl-xl full-width q-ma-sm row"
        :icon="mdiStorefrontOutline"
        size="20px"
        flat
        label="Réseau"
        no-caps
      />
      <q-btn
        align="left"
        class="q-pl-xl full-width left-side q-ma-sm q-my-lg row"
        size="20px"
        :icon="mdiHammerWrench"
        flat
        label="Gestion"
        no-caps
      >
      <q-avatar
        class="q-ml-lg"
        color="teal-10"
        text-color="white"
        size="30px">
        {{collections_number}}
      </q-avatar>
      </q-btn>
      <div class="bottom">
        <q-btn
          align="left"
          class="q-pl-xl q-ma-sm row relative"
          :icon="mdiHelpCircleOutline"
          flat
          label="Aide"
          no-caps
        />
        <q-img
          class="q-ma-lg relative"
          src="/drawer-logo.png"/>
      </div>
    </q-drawer>
      <q-btn
        v-if="!drawer"
        class="fixed-top-left q-ma-sm above"
        flat
        dense
        round
        icon="menu"
        aria-label="Menu"
        @click="drawer = true"
      />
    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import { mdiViewDashboardOutline, mdiCheckboxMarkedCirclePlusOutline, mdiNoteTextOutline, mdiStorefrontOutline, mdiHammerWrench, mdiHelpCircleOutline } from '@quasar/extras/mdi-v6';
import api from 'src/services/api';

export default defineComponent({
  name: 'MainLayout',
  setup() {
    const drawer = ref(false);
    const collections_number = ref(0);
    return {
      drawer,
      collections_number,
      mdiViewDashboardOutline: '',
      mdiCheckboxMarkedCirclePlusOutline: '',
      mdiNoteTextOutline: '',
      mdiStorefrontOutline: '',
      mdiHammerWrench: '',
      mdiHelpCircleOutline: '',
    }
  },
  created() {
    this.mdiViewDashboardOutline = mdiViewDashboardOutline;
    this.mdiCheckboxMarkedCirclePlusOutline = mdiCheckboxMarkedCirclePlusOutline;
    this.mdiNoteTextOutline = mdiNoteTextOutline;
    this.mdiStorefrontOutline = mdiStorefrontOutline;
    this.mdiHammerWrench = mdiHammerWrench;
    this.mdiHelpCircleOutline = mdiHelpCircleOutline;
  },
  mounted() {
    this.fetchCollections()
  },
  methods: {
    async fetchCollections() {
      const response = await api.get('/collections')
      this.collections_number = response.data.length
    },
  },
});
</script>

<style lang="sass" scoped>
.padding-top
  margin-top: 16vh

.above
  z-index: 9999

.bottom
  position: absolute
  bottom: 10px
</style>
