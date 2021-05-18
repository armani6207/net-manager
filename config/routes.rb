Rails.application.routes.draw do
  get '/' => 'static#home'

  resources :devices

  resources :users, only: [:new, :create, :show, :edit, :update] do
    resources :networks
  end

  get '/login' => 'sessions#new', :as => 'login'

  post '/sessions' => 'sessions#create'

  get '/logout' => 'sessions#destroy', :as => 'logout'

  get '/users/:user_id/networks/:id/add_device' => 'networks#add_device_form', :as => 'new_device_form'

  post '/users/:user_id/networks/:id/add_device' => 'networks#add_device', :as => 'create_device_form'

  delete '/connections/:id' => 'connections#destroy', :as => 'delete_connection'

end
