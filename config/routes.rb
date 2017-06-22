Rails.application.routes.draw do
  resources :avaliacao_festa
  resources :avaliacao_baladas
  resources :usuarios
  resources :festa
  resources :baladas
  resources :cadastros
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'festa#index'
  get '/administrador', to: 'administrador#show'
  resources :administradors
  resources :festas
  get '/gambeta', to: 'gambeta#show'
end
