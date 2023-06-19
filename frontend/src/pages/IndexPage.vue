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
              <q-card-section class="text-justify">
                Adoba s'engage à organiser des collectes de denrées alimentaires de manière régulière. Cette application permet de renseigner et suivre les collectes de denrées alimentaires du magasin. Ainsi qu'à définir les indicateurs de collectes à relever.
              </q-card-section>
            </q-card>
          </div>
            </div>
          <div class="col-12 col-md">
            <div class="q-pa-xs">
            <q-card flat>
              <q-card-section>
                Child
              </q-card-section>
            </q-card>
          </div>
          </div>
        </div>

        <div class="row" style="width: 95%;">
          <div class="col-12 col-md">
            <div class="q-pa-xs">
            <q-card flat>
              <q-card-section>
                <OrganizationOverview logo="/adoba-logo.png"/>
              </q-card-section>
            </q-card>
          </div>
          <div class="q-pa-xs">
            <q-card flat>
              <q-card-section>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus illum impedit magni fugiat cupiditate animi aliquam. Illum beatae nesciunt ex cupiditate ad quidem quos eligendi, consequatur voluptatum quaerat expedita quisquam!
              </q-card-section>
            </q-card>
          </div>
            </div>
          <div class="col-12 col-md">
            <div class="q-pa-xs">
            <q-card flat>
              <q-card-section>
                Child
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
import api from 'src/services/api';

export default defineComponent({
  name: 'IndexPage',
  components: { HeadPage, OrganizationOverview },
  setup() {
    const collections_number = ref(0);
    return {
      collections_number,
    }
  },
  mounted() {
    this.fetchCollectionsNumber();
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
    },
  },
});
</script>
