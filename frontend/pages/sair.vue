<template>

</template>


<script setup lang="ts">
import { useUserStore } from '@/stores/user'
const userStore = useUserStore()

const logout = async () => {
  await userStore.logout()
  return navigateTo('/')
}

logout()
</script>
