<template>
  <q-page class="bg-cyan-1">
    <HeadPage />
    <div class="row flex-center">
      <div class="row" style="width: 90%;">
          <div class="q-pr-sm q-pb-sm col-12 col-md" >
            <q-card style="height: 450px;" flat>
              <q-card-section>
                <OrganizationOverview logo="/adoba-logo.png"/>
              </q-card-section>
              <q-card-section>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus illum impedit magni fugiat cupiditate animi aliquam. Illum beatae nesciunt ex cupiditate ad quidem quos eligendi, consequatur voluptatum quaerat expedita quisquam!
              </q-card-section>
            </q-card>
          </div>
          <div class="q-pr-sm q-pb-sm col-12 col-md">
            <q-card style="height: 450px;" flat>
              <q-card-section>
                Child
              </q-card-section>
            </q-card>
          </div>
        </div>
      </div>
  </q-page>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import api from 'src/services/api';
import HeadPage from 'components/HeadPage.vue';
import OrganizationOverview from 'components/OrganizationOverview.vue';
import { Collection } from 'components/models';

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
