<template>
  <div>
    <ApiNavigation />
  </div>

  <v-row class="mt-2" justify="center">
    <v-col cols="10" md="5">
      <v-card>
        <v-card-title class="d-flex justify-space-around mb-6" style="color: #616161">
          <v-avatar color="teal-lighten-4" size="40">
            <v-icon size="40" color="white">mdi-account-circle</v-icon>
          </v-avatar>
          Bem vindo ao seu Perfil<br />
          (Nome do Usuário)
        </v-card-title>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
import ApiNavigation from '@/components/ApiNavigation.vue'

export default {
  name: 'index',
  data() {
    return {
      loading: false,
    }
  },
}
</script>
<style scoped>
#card {
  background-color: rgba(255, 255, 255, 0.637);
}
</style>
