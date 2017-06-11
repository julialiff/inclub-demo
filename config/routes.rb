Rails.application.routes.draw do
  resources :festa
  resources :baladas
  resources :cadastros
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'baladas#index'
  get '/administrador', to: 'administrador#show'
  resources :administradors
  resources :festas
  get '/gambeta', to: 'gambeta#show'
end
