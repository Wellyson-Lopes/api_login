<template>
  <v-navigation-drawer v-model="drawer" color="teal">
    <br />
    <br />
    <v-list nav>
      <v-card color="teal">
        <v-card-title> API </v-card-title>
        <v-list-item prepend-icon="mdi-account-multiple-plus" title="Cadastro" to="/"></v-list-item>
        <v-card color="teal">
          <v-card-title> API - 1 </v-card-title>
          <v-list-item prepend-icon="mdi-clipboard-account" title="Nova O.T." to="/"></v-list-item>
          <v-card color="teal">
            <v-card-title> Relatórios </v-card-title>
            <v-list-item prepend-icon="mdi-clipboard-text-multiple" title="cadastrados" to="/"></v-list-item>
            <v-list-item prepend-icon="mdi-table-account" title="Atendimentos da semana" color="teal"
              to="/"></v-list-item>
            <v-list-item prepend-icon="mdi-medication" title="Dados sobre saúde" color="teal" to="/"></v-list-item>
          </v-card>
        </v-card>
      </v-card>
    </v-list>
  </v-navigation-drawer>

  <v-app-bar color="teal">
    <v-app-bar-nav-icon @click="drawer = !drawer"> </v-app-bar-nav-icon>

    <v-toolbar-title>
      <v-btn title="Perfil" variant="plain" size="x-large" to="/usuarios/perfil">
        <v-icon>mdi-home-circle</v-icon> </v-btn>API
    </v-toolbar-title>
  </v-app-bar>
</template>
<script>
export default {
  name: 'index',
  data() {
    return {
      drawer: false,
      currentTime: null,
    }
  },
  created() {
    this.updateTime()
    setInterval(this.updateTime, 1000)
  },
  methods: {
    updateTime() {
      const now = new Date()
      this.currentTime = now.toLocaleString()
    },
  },
}
</script>
