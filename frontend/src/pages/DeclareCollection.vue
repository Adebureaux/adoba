<template>
  <q-page class="bg-cyan-1">
    <HeadPage location="Declarations"/>
    <div class="bg-wite text-black text-center q-pa-md flex flex-center">
     <div>
      <div class="interpolate-font-title">
        Déclarer une collecte
      </div>
      <div>
        <q-form @submit="onSubmit">
          <div class="interpolate-font">Date</div>
          <q-date minimal v-model="date" />
          <q-input required filled v-model="name" label="Nom de la collecte" />
          <q-input required filled v-model="asso" label="Nom de l'association" />
          <div v-for="(indicator, i) in indicators" v-bind:key="i">
            <q-input required filled v-model="input[i]" :label=indicator />
          </div>
          <div>
            <q-btn type="submit" color="primary" label="submit" />
          </div>
        </q-form>
      </div>
    </div>
  </div>
</q-page>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import api from 'src/services/api';
import HeadPage from 'components/HeadPage.vue';
import { ICollection } from 'components/models';

export default defineComponent({
  name: 'DecalreCollection',
  components: { HeadPage },
  data() {
    const asso = ref('');
    const name = ref('');
    const input = [] as string[];
    const date = ref(new Date().toLocaleDateString('en-CA').replace(/-/g, '/'));
    return {
      name,
      date,
      asso,
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
          this.input[i] = ''
      })
      .catch(error => {
        if (error.code === 'ERR_NETWORK')
          console.error('Network error: Cant connect the API.');
        else
          console.error(error.message);
      })
    },
    onSubmit() {
      const payload = {} as ICollection;
      const dynamic_attributes: { [key: string]: string } = {};
      payload.name = this.name;
      payload.date = this.date;
      payload.association_name = this.asso;
      for (let i = 0; i < this.indicators.length; i++)
        dynamic_attributes[this.indicators[i]] = this.input[i];
      payload.dynamic_attributes = dynamic_attributes;
      api.post('/collections', payload)
      .then(() => {
        this.asso = '';
        this.name = '';
        this.input = [] as string[];
        this.date = new Date().toLocaleDateString('en-CA').replace(/-/g, '/');
        this.$router.push({
          path: '/actions'
        })
      })
      .catch(error => {
        if (error.code === 'ERR_NETWORK')
          console.error('Network error: Cant connect the API.')
        else
          console.error(error.message)
      })
    },
  }
});
</script>
