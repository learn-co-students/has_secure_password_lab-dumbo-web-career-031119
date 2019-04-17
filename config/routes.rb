Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get '/homepage', to: "users#homepage" 

  resources :sessions, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
