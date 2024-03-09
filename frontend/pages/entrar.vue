<template>
  <v-row class="mt-15" justify="center">
    <v-col cols="10" md="5">
      <v-card class="mx-auto" id="login-card">
        <br />
        <div class="text-center">
          <v-avatar color="teal-lighten-4" size="75">
            <v-icon size="80" color="white">mdi-account-circle</v-icon>
          </v-avatar>
        </div>
        <v-card-title class="text-center"> Login </v-card-title>
        <v-form ref="form" v-model="valido">
          <v-card-text>
            <v-text-field color="teal-lighten-4" v-model="email" variant="underlined" prepend-icon="mdi-account"
              label="E-mail" required autofocus />
            <v-text-field color="teal-lighten-4" v-model="senha" variant="underlined" prepend-icon="mdi-lock"
              :append-icon="exibirSenha ? 'mdi-eye' : 'mdi-eye-off'" :type="exibirSenha ? 'text' : 'password'"
              label="Senha" @click:append="() => (exibirSenha = !exibirSenha)" required />
            <v-progress-linear :active="loading" :indeterminate="loading" absolute bottom
              color="teal"></v-progress-linear>
            <div class="d-flex justify-end">
              <v-btn color="amber-darken-4" variant="plain" x-small>
                Esqueceu a senha?
              </v-btn>
            </div>
            <br />
            <v-scale-transition>
              <div v-if="!loading" class="text-center">
                <v-btn block color="teal" @click="fazerLogin"> Entrar </v-btn>
                <br />
              </div>
            </v-scale-transition>
          </v-card-text>
        </v-form>
      </v-card>
    </v-col>
  </v-row>
</template>

<script setup>
import { useUserStore } from "@/stores/user.ts";

definePageMeta({
  middleware: ["usuario-ja-logado"],
});

const store = useUserStore();
const token = store.token;

const email = ref("admin@com.br");
const senha = ref("admin");
const valido = ref(true);
const exibirSenha = ref(true);
const loading = ref(false);

const fazerLogin = async () => {
  loading.value = true;
  await store.login(email.value, senha.value);
  loading.value = false;
};

// export default {
//   data() {
//     return {
//       drawer: null,
//       loading: false,
//       email: 'shayani@gmail.com',
//       senha: '12345',
//       valido: true,
//       exibirSenha: false,
//       emailRules: [
//         (v) => !!v || 'E-mail é obrigatório',
//         (v) => /.+@.+\..+/.test(v) || 'E-mail inválido',
//       ],
//       passwordRules: [
//         (v) => !!v || 'Senha é obrigatória',
//         (v) => v.length >= 8 || 'Senha deve conter pelo menos 8 caracteres',
//       ],
//     }
//   },
//   methods: {
//     fazerLogin() {
//       // this.loading = true
//       // this.$refs.form.validate()

//       $fetch('http://127.0.0.1:3000/api/login', {
//         method: 'POST',
//         body: {
//           email: this.email,
//           password: this.senha,
//         },
//       })
//         .then((response) => {
//           console.log(response)
//         })
//         .finally(() => {
//           this.loading = false
//         })

//     },
//   },
// }
</script>

<style scoped>
#login-card {
  background-color: rgb(255, 255, 255);
}
</style>
