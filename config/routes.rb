Rails.application.routes.draw do

  root "welcome#about"

#users and users project paths
  resources :users do
    resources :projects, except: :index
    delete '/projects/:id', to: 'projects#delete', as: :delete_project
  end

  get '/active_projects', to: 'projects#index'
  post '/back_project/:id', to: 'backed_projects#back_project', as: :back_project

  get '/category/:name', to: 'categories#category', param: :name



  get "/login", to: 'sessions#new', as: 'login'
  post "/logging_in", to: 'sessions#create', as: 'logging_in'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

end
