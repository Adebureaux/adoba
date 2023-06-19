<template>
  <q-page class="bg-cyan-1">
    <HeadPage location="Declarations"/>
      <div class="q-px-md q-ml-xl interpolate-font-title">
        Déclarer une collecte
      </div>
      <div class="q-ml-xl">
        <q-form @submit="onSubmit" class="q-gutter-md">
          <div class="row no-wrap">
            <div class="col-auto q-ma-md">
              <div class="q-pa-xs">
                <q-date minimal v-model="date" />
              </div>
            </div>
            <div class="col-auto q-mt-md">
              <div class="q-pa-xs">
                <q-input required filled v-model="name" label="Nom de la collecte" />
              </div>
              <div class="q-pa-xs">
                <q-input required filled v-model="asso" label="Nom de l'association" />
              </div>
              <div v-for="(indicator, i) in indicators" :key="i" class="q-pa-xs">
                <q-input required filled v-model="input[i]" :label="indicator" />
              </div>
              <div class="text-center q-pa-xs q-my-lg">
                <q-btn type="submit" color="primary" label="Déclarer" />
              </div>
            </div>
          </div>
        </q-form>

      </div>
</q-page>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import { useQuasar } from 'quasar';
import api from 'src/services/api';
import HeadPage from 'components/HeadPage.vue';
import { ICollection } from 'components/models';

export default defineComponent({
  name: 'DecalreCollection',
  components: { HeadPage },
  setup() {
    const $q = useQuasar();

    const success = () => {
      $q.notify({
        type: 'positive',
        message: 'La collecte a été enregistrée avec succès.'
      });
    }
    const failed = (message: string) => {
      $q.notify({
        type: 'warning',
        message: `${message}.`
      });
    }
    return {
      success,
      failed
    }
  },
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
        this.$router.push({ path: '/actions' });
        this.success();
      })
      .catch(error => {
        if (error.code === 'ERR_NETWORK')
          console.error('Network error: Cant connect the API.')
        else
          console.error(error.message)
        this.failed(error.response.data.error);
      })
    },
  }
});
</script>
