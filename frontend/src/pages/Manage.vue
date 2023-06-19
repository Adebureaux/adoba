<template>
<q-page class="bg-cyan-1">
  <HeadPage location="Gestion" />
  <div class="q-px-md q-ml-xl interpolate-font-title">
    Ajouter ou supprimer des indicateurs de collecte
  </div>
  <div class="q-pa-md q-ml-xl">
    <q-item v-for="(indicator, i) in indicators" v-bind:key="i">
      <div class="row">
        <q-input disable v-model="input[i]" />
        <q-btn @click="removeAttribute(indicator)" class="q-ma-md" color="warning" :icon="mdiTrashCanOutline"/>
      </div>
    </q-item>
    <q-item>
      <q-form class="row" @submit="addAttribute">
        <q-input v-model="newInput" />
        <q-btn class="q-ma-md" color="primary" type="submit" :icon="mdiPlus" />
      </q-form>
  </q-item>
  </div>
</q-page>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import { useQuasar } from 'quasar';
import { mdiTrashCanOutline, mdiPlus } from '@quasar/extras/mdi-v6';
import HeadPage from 'components/HeadPage.vue';
import api from 'src/services/api';

export default defineComponent({
  name: 'ManageIndicators',
  components: { HeadPage },
  setup() {
    const $q = useQuasar();

    const failed = (message: string) => {
      $q.notify({
        type: 'warning',
        message: `${message}.`
      });
    }
    return {
      failed
    }
  },
  data() {
    const input = [] as string[];
    const newInput = '';
    return {
      mdiTrashCanOutline,
      mdiPlus,
      newInput,
      input,
      indicators: ref<string[]>([])
    }
  },
  mounted() {
    this.fetchIndicators()
  },
  methods: {
    fetchIndicators() {
      api.get('/indicators')
      .then(response => {
        this.indicators = response.data.dynamic_attributes[0];
        for (let i = 0; i < this.indicators?.length; i++)
          this.input[i] = this.indicators[i];
      })
      .catch(error => {
        if (error.code === 'ERR_NETWORK')
          console.error('Network error: Cant connect the API.');
        else
          console.error(error.message);
      })
    },
    removeAttribute(indicator: string) {
      api.delete(`/indicators?indicator=${indicator}`)
      .then(() => {
        this.indicators = this.indicators.filter(e => e !== indicator);
        this.input = this.input.filter(e => e !== indicator);
      })
      .catch(error => {
        if (error.code === 'ERR_NETWORK')
          console.error('Network error: Cant connect the API.')
        else
          console.error(error.message)
      })
    },
    addAttribute() {
      api.patch('/indicators', {indicator: this.newInput})
      .then(() => {
        this.indicators.push(this.newInput);
        this.input.push(this.newInput);
        this.newInput = '';
      })
      .catch(error => {
        if (error.code === 'ERR_NETWORK')
          console.error('Network error: Cant connect the API.');
        else
          console.error(error.message);
        this.failed(error.response.data.error);
      })
    }
  }
});
</script>
