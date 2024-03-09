import { useUserStore } from '../stores/user'
import { storeToRefs } from 'pinia'

export default defineNuxtRouteMiddleware((to, from) => {
  const userStore = useUserStore()
  const { logado } = storeToRefs(userStore)

  console.log(logado.value)
  if (to.fullPath === '/entrar' && logado.value) {
    return navigateTo('/')
  }
})
