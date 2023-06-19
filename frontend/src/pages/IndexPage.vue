<template>
  <q-page class="bg-cyan-1">
    <HeadPage />
    <div class="row flex-center">
      <div class="row" style="width: 95%;">
          <div class="col-12 col-md">
            <div class="q-pa-xs">
              <q-card flat>
                <q-card-section>
                  <OrganizationOverview logo="/adoba-logo.png" :actions=collections_number :establishment_number=1 />
                </q-card-section>
              </q-card>
            </div>
          <div class="q-pa-xs">
            <q-card flat>
              <q-card-section class="text-justify interpolate-font">
                Adoba s'engage à organiser des collectes de denrées alimentaires de manière régulière. Cette application permet de renseigner et suivre les collectes de denrées alimentaires du magasin. Ainsi qu'à définir les indicateurs de collectes à relever.
              </q-card-section>
            </q-card>
          </div>
            </div>
          <div class="col-12 col-md">
            <div class="q-pa-xs">
            <q-card flat>
              <q-card-section>
                <div class="q-gutter-md">
                <q-carousel
                  animated
                  v-model="slide"
                  navigation
                  infinite
                  :autoplay="autoplay"
                  arrows
                  transition-prev="slide-right"
                  transition-next="slide-left"
                  @mouseenter="autoplay = false"
                  @mouseleave="autoplay = true"
                  class="bg-primary text-white shadow-1 rounded-borders"
                >
                  <q-carousel-slide v-for="collection in collections" v-bind:key="collection.id" :name='collection.id' class="column no-wrap flex-center">
                    <span class="text-bold interpolate-font">{{ collection.name }}</span>
                    <ul class="interpolate-font">
                      <li>
                        Association: <span class="text-bold">{{collection.association_name}}</span>
                      </li>
                      <li>
                        Date: <span class="text-bold">{{collection.date}}</span>
                      </li>
                    </ul>
                  </q-carousel-slide>
                </q-carousel>
              </div>
              </q-card-section>
            </q-card>
          </div>
          </div>
          </div>
        </div>
  </q-page>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import HeadPage from 'components/HeadPage.vue';
import OrganizationOverview from 'components/OrganizationOverview.vue';
import { ICollection } from 'src/components/models';
import api from 'src/services/api';

export default defineComponent({
  name: 'IndexPage',
  components: { HeadPage, OrganizationOverview },
  setup() {
    const collections_number = ref(0);
    return {
      slide: ref(0),
      autoplay: ref(false),
      collections_number,
      collections: [] as ICollection[]
    }
  },
  mounted() {
    this.fetchCollections();
  },
  methods: {
    fetchCollections() {
      api.get('/collections')
      .then(response => {
        this.collections = response.data;
        this.collections_number = response.data.length;
        this.slide = 1
      })
      .catch(error => {
        if (error.code === 'ERR_NETWORK')
          console.error('Network error: Cant connect the API.');
        else
          console.error(error.message);
      })
    },
  },
});
</script>
