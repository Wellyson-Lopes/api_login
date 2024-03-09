<template>
  <v-app-bar color="primary" density="compact" flat prominent>
    <v-app-bar-nav-icon variant="text" @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
    <v-app-bar-title>
      <nuxt-link to="/" class="link-branco">API</nuxt-link>
    </v-app-bar-title>
    <template v-slot:append>
      {{ nome }}
      <v-btn icon="mdi-dots-vertical"></v-btn>
    </template>
  </v-app-bar>
  <v-navigation-drawer temporary v-model="drawer"> </v-navigation-drawer>
</template>

<script setup>
import { useUserStore } from "@/stores/user";
const userStore = useUserStore();
const { nome } = storeToRefs(userStore);

let drawer = ref(false);
</script>

<style scoped>
.link-branco {
  color: white;
  text-decoration: none;
}
</style>
