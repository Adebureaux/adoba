<template>
  <div class="row" style="width: 95%;">
    <div class="full-width">
      <div class="q-pa-md">
        <q-card flat>
          <q-card-section>
            Nom de la collecte: <span class="text-bold">{{ collection.name }}</span>
         </q-card-section>
         <q-card-section>
          Association: <span class="text-bold">{{ collection.association_name }}</span>
         </q-card-section>
         <q-card-section>
          Date: <span class="text-bold">{{ collection.date }}</span>
         </q-card-section>
          <q-card-section v-for="(attribute, key) in collection.dynamic_attributes.dynamic_attributes" v-bind:key="attribute">
            {{ key }}: <span class="text-bold">{{ attribute }}</span>
          </q-card-section>
        </q-card>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import { ICollection } from 'src/components/models';

export default defineComponent({
  name: 'CollectionCard',
  props: {
    collection: { type: Object as () => ICollection, default: () => ({} as ICollection) }
  },
})
</script>
