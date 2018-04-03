Rails.application.routes.draw do

  root "welcome#home"

  resource :sessions, only:[:new, :create, :destroy]

  resources :users do
    resources :projects, only:[:new, :create, :show, :index]
  end

end
