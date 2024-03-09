import { defineStore } from 'pinia'

interface ApiRespose {
  token: string,
  usuario: {
    id: number,
    nome: string,
    email: string
  }
}

interface UserState {
  id: number | null,
  nome: string | null,
  logado: boolean,
  token: string
}

export const useUserStore = defineStore('user', {
  state: (): UserState => ({
    id: null,
    nome: null,
    logado: false,
    token: 'token_no_store2'
  }),
  persist: true,
  actions: {
    async login(email: string, senha: string) {
      try {
        const resposta: ApiRespose = await $fetch('http://127.0.0.1:3000/api/login', {
          method: 'POST',
          body: {
            email: email,
            senha: senha,
          },
        })

        this.$patch({
          id: resposta.usuario.id,
          nome: resposta.usuario.nome,
          logado: true,
          token: resposta.token
        })

        this.setTokenCookie(resposta.token)
        navigateTo('/')
      } catch (error) {
        alert(error)
      }

    },
    logout() {
      this.$patch({
        id: null,
        nome: null,
        logado: false,
        token: ''
      })
      this.setTokenCookie('')
    },
    setTokenCookie(token: string) {
      let tokenCookie = useCookie('token')
      tokenCookie.value = token
    }
  }
})
