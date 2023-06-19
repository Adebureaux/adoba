<template>
<q-page class="bg-cyan-1">
  <HeadPage location="Actions" />
  <div v-for="collection in collections" v-bind:key="collection.id">
    <CollectionCard :collection="collection" />
  </div>
</q-page>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import api from 'src/services/api';
import HeadPage from 'components/HeadPage.vue';
import CollectionCard from 'components/CollectionCard.vue';
import { ICollection } from 'src/components/models';

export default defineComponent({
  name: 'ActionsTracking',
  components: { HeadPage, CollectionCard },
  data() {
    return {
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
        console.log(response);
        this.collections = response.data;
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
