Rails.application.routes.draw do
  namespace :api do
    defaults format: :json do
      post :login, to: "usuarios#login"

      resources :usuarios
    end
  end
end
