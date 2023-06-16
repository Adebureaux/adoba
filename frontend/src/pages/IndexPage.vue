<template>
  <q-page class="bg-cyan-1">
    <HeadPage />
  </q-page>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import HeadPage from 'components/HeadPage.vue';
import { Collection } from 'components/models';

export default defineComponent({
  name: 'IndexPage',
  components: { HeadPage },
});
</script>
