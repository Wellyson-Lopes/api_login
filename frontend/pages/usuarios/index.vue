<template>
  <v-table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>email</th>
        <th>Criado em</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="usuario in usuarios" :key="usuario.id">
        <td>{{ usuario.id }}</td>
        <td>{{ usuario.nome }}</td>
        <td>{{ usuario.email }}</td>
        <td>{{ usuario.created_at }}</td>
      </tr>
    </tbody>
  </v-table>
  <nuxt-link to="/usuarios/novo">Criar novo Usuario</nuxt-link>
</template>

<script setup>
definePageMeta({
  middleware: ["autenticacao"],
});

const usuarios = ref({});
// import axios from 'axios'

// export default {
//   data() {
//     return {
//       usuarios: null,
//     }
//   },
//   async mounted() {
//     $fetch('http://127.0.0.1:3000/api/users')
//       .then((response) => {
//        this.usuarios = response
//         console.log(response)
//       })

//   },
// }
</script>
