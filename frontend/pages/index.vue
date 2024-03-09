<template>
  <div>
    <h1>Home</h1>
    <br />
    <br />
    <div v-if="usuario.logado">
      <br />
      <NuxtLink to="/sair" v-if="usuario.logado">Sair</NuxtLink>

      <v-row>
        <v-col cols="12" md="4" offset-md="3">
          <v-card>
            <v-card-title>Administração</v-card-title>
            <v-card-text>
              <v-list>
                <v-list-item
                  title="Usuarios"
                  value="usuarios"
                  link
                  nuxt
                  to="/usuarios"
                  prepend-icon="mdi-account"
                ></v-list-item>
              </v-list>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>

      <debug-usuario></debug-usuario>
    </div>
    <div v-else>
      <NuxtLink to="/entrar" v-if="!usuario.logado">Entrar</NuxtLink>
    </div>
  </div>
</template>

<script setup>
import { useUserStore } from "@/stores/user.ts";

const userStore = useUserStore();
const usuario = userStore.$state;
</script>
