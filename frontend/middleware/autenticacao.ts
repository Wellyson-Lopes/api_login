import { useUserStore } from '../stores/user'
import { storeToRefs } from 'pinia'

export default defineNuxtRouteMiddleware((to, from) => {
  const userStore = useUserStore()
  const { logado } = storeToRefs(userStore)

  if (logado.value === false) {
    return navigateTo('/')
  }
})
