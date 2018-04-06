Rails.application.routes.draw do

  root "welcome#home"

#users and users project paths
  resources :users do
    resources :projects, except: :index
    delete '/projects/:id', to: 'projects#delete', as: :delete_project
  end

  get '/projects', to: 'projects#index'


  get "/login", to: 'sessions#new', as: 'login'
  post "/logging_in", to: 'sessions#create', as: 'logging_in'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

end
