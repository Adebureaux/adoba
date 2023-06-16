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
        class="q-pl-xl full-width q-ma-sm q-my-lg row"
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
        size="30px"
      >
        {{collections_number}}
      </q-avatar>
      </q-btn>
      <div class="bottom">
        <div>
          <q-btn
            align="left"
            class="q-pl-xl full-width q-ma-sm row"
            :icon="mdiHelpCircleOutline"
            size="20px"
            flat
            label="Aide"
            no-caps
          />
        </div>
        <div class="q-ma-xl">
          <q-img src="/drawer-logo.png" />
        </div>
      </div>
    </q-drawer>
      <q-btn
        v-if="!drawer"
        class="fixed-left vertical-middle q-ma-sm above"
        color="grey-7"
        flat
        dense
        :icon="mdiArrowRightBoldOutline"
        aria-label="Drawer"
        @click="drawer = true"
      />
    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import { mdiViewDashboardOutline, mdiCheckboxMarkedCirclePlusOutline, mdiNoteTextOutline, mdiStorefrontOutline, mdiHammerWrench, mdiHelpCircleOutline, mdiArrowRightBoldOutline } from '@quasar/extras/mdi-v6';
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
      mdiArrowRightBoldOutline: '',
    }
  },
  created() {
    this.mdiViewDashboardOutline = mdiViewDashboardOutline;
    this.mdiCheckboxMarkedCirclePlusOutline = mdiCheckboxMarkedCirclePlusOutline;
    this.mdiNoteTextOutline = mdiNoteTextOutline;
    this.mdiStorefrontOutline = mdiStorefrontOutline;
    this.mdiHammerWrench = mdiHammerWrench;
    this.mdiHelpCircleOutline = mdiHelpCircleOutline;
    this.mdiArrowRightBoldOutline = mdiArrowRightBoldOutline;
  },
  mounted() {
    this.fetchCollections()
  },
  methods: {
    async fetchCollections() {
      const response = await api.get('/collections/count')
      this.collections_number = response.data.count
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
  bottom: 12px
  display: flex
  flex-direction: column
  width: 100%
  justify-content: flex-start
</style>
