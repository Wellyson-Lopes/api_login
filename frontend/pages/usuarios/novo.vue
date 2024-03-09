<template>
  <v-card>
    <v-row>
      <v-col cols="4" offset="3">
        <v-form ref="form">
          <v-card-text>
            <v-text-field
              v-model="dados.nome"
              variant="underlined"
              label="Nome"
              required
              autofocus
            />
            <v-text-field
              v-model="dados.email"
              variant="underlined"
              label="Email"
              required
            />
            <v-text-field
              v-model="dados.senha"
              variant="underlined"
              label="senha"
              required
            />
            <v-btn @click="salvar" color="blue"> Salvar </v-btn>
          </v-card-text>
        </v-form>
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      dados: {
        nome: null,
        email: null,
        senha: null,
      },
    }
  },
  methods: {
    async salvar() {
      await useFetch('/api/usuarios/novo', {
        method: 'POST',
        body: JSON.stringify({
          nome: this.dados.nome,
          email: this.dados.email,
          senha: this.dados.senha,
        }),
      })
      this.$router.push('/usuarios')
    },
  },
}
</script>
