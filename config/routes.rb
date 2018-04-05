Rails.application.routes.draw do

  root "welcome#home"

#users and users project paths
  resources :users do
    resources :projects, only:[:new, :create, :show, :index, :edit], as: :project
    delete '/projects/:id', to: 'projects#delete', as: :delete_project
  end

#non-users
  resources :projects, only: [:show, :index]

  get "/login", to: 'sessions#new', as: 'login'
  post "/logging_in", to: 'sessions#create', as: 'logging_in'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

end
