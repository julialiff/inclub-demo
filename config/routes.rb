Rails.application.routes.draw do
  get 'sessions/new'

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

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post 'checkin', to: 'checkin#new'
  delete 'checkin_delete', to: 'checkin#destroy'

  get 'search', to: 'festa#search'
end
