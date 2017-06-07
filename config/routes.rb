Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'baladas#index'
  get '/administrador',  to: 'administrador#show'
  # resources :baladas
end
