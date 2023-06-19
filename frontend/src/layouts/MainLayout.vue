<template>
  <q-layout view="lHh Lpr lFf">
    <q-drawer
      v-model="drawer"
      show-if-above
      :width=250
      :breakpoint=560
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
        to="/actualites"
      />
      <q-btn
        align="left"
        class="q-pl-xl full-width q-ma-sm row"
        size="20px"
        :icon="mdiCheckboxMarkedOutline"
        flat
        label="Actions"
        no-caps
        to="/actions"
      >
        <q-avatar
          class="q-ml-lg"
          color="teal-10"
          text-color="white"
          size="25px"
        >
          {{collections_number}}
        </q-avatar>
      </q-btn>
      <q-btn
        align="left"
        class="q-pl-xl full-width q-ma-sm row"
        :icon="mdiNoteTextOutline"
        size="20px"
        flat
        label="Declarations"
        no-caps
        no-wrap
        to="/declarations"
      />
      <q-btn
        align="left"
        class="q-pl-xl full-width q-ma-sm q-my-lg row"
        size="20px"
        :icon="mdiHammerWrench"
        flat
        label="Gestion"
        no-caps
        to="/gestion"
      />
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
        class="fixed-top-left q-ma-sm above"
        color="grey-7"
        flat
        dense
        :icon="mdiMenu"
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
import { mdiViewDashboardOutline, mdiCheckboxMarkedOutline, mdiNoteTextOutline, mdiHammerWrench, mdiHelpCircleOutline, mdiMenu } from '@quasar/extras/mdi-v6';
import api from 'src/services/api';

export default defineComponent({
  name: 'MainLayout',
  setup() {
    const drawer = ref(false);
    const collections_number = ref(0);
    return {
      drawer,
      collections_number,
    }
  },
  data() {
    return {
      mdiViewDashboardOutline,
      mdiCheckboxMarkedOutline,
      mdiNoteTextOutline,
      mdiHammerWrench,
      mdiHelpCircleOutline,
      mdiMenu
    }
  },
  mounted() {
    this.fetchCollectionsNumber()
  },
  methods: {
    fetchCollectionsNumber() {
      api.get('/collections/count')
      .then(response => {
        this.collections_number = response.data.count;
      })
      .catch(error => {
        if (error.code === 'ERR_NETWORK')
          console.error('Network error: Cant connect the API.')
        else
          console.error(error.message)
      })
    }
  },
});
</script>

<style lang="sass" scoped>
.padding-top
  margin-top: 15vh

.bottom
  margin-top: 25vh
.above
  z-index: 9999
</style>
