<template>
<q-page class="bg-cyan-1">
  <HeadPage location="Gestion" />
  <div class="absolute-center">
    <q-item v-for="(indicator, i) in indicators" v-bind:key="i">
      <div class="row">
        <q-input disabled v-model="input[i]" />
        <q-btn @click="removeAttribute(indicator)" class="q-ma-md" color="warning" :icon="mdiTrashCanOutline"/>
      </div>
    </q-item>
    <q-item>
      <q-form class="row">
        <q-input v-model="newInput" />
        <q-btn class="q-ma-md" color="primary" :icon="mdiPlus" />
      </q-form>
  </q-item>
  </div>
</q-page>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import { mdiTrashCanOutline, mdiPlus } from '@quasar/extras/mdi-v6';
import HeadPage from 'components/HeadPage.vue';
import api from 'src/services/api';

export default defineComponent({
  name: 'ManageIndicators',
  components: { HeadPage },
  data() {
    const input = [] as string[];
    const newInput = "";
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
        for (let i = 0; i < this.indicators.length; i++)
          this.input[i] = this.indicators[i];
        console.log(this.indicators)
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
    }
  }
});
</script>
