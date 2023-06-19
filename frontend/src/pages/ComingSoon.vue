<template>
    <q-page class="bg-cyan-1">
    <HeadPage />
    <div class="text-black text-center absolute-center">
      <div>
        <div class="interpolate-font">
          Il semblerait que cette page ne soit pas encore disponible ...
        </div>

        <q-btn
          class="q-mt-xl"
          color="primary"
          text-color="white"
          unelevated
          to="/"
          label="Retour"
          no-caps
        />
      </div>
    </div>
  </q-page>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import HeadPage from 'components/HeadPage.vue';

export default defineComponent({
  name: 'ComingSoon',
  components: { HeadPage },
});
</script>
