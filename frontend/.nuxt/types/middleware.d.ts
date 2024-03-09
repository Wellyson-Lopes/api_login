import type { NavigationGuard } from 'vue-router'
export type MiddlewareKey = "autenticacao" | "usuario-ja-logado"
declare module "/home/wellyson/estudos/api_login/frontend/node_modules/nuxt/dist/pages/runtime/composables" {
  interface PageMeta {
    middleware?: MiddlewareKey | NavigationGuard | Array<MiddlewareKey | NavigationGuard>
  }
}