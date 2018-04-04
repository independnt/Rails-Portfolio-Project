Rails.application.routes.draw do

  root "welcome#home"

  resources :users do
    resources :projects, only:[:new, :create, :show, :index]
  end

  get "/login", to: 'sessions#new', as: 'login'
  post "/logging_in", to: 'sessions#create', as: 'logging_in'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

end
