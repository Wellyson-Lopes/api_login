<template>
  <v-dialog v-model="dialog">
    <v-card>
      <v-card-title>Debug</v-card-title>
      <v-card-text>
        <pre>
          Usuario: {{ usuario }}
        </pre>
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="primary" text @click="dialog = false">Fechar</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
  <v-btn color="warning" @click="dialog = true" size="x-small" variant="text"
    >Debug: Usuário</v-btn
  >
</template>

<script setup>
import { useUserStore } from "@/stores/user.ts";
const userStore = useUserStore();
const usuario = userStore.$state;
const dialog = ref(false);
</script>
