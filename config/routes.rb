Rails.application.routes.draw do
  get '/' => 'static#home'

  resources :networks

  resources :devices

  resources :users, only: [:new, :create, :show, :edit, :update] 

  get '/users/:id/networks' => 'users#networks', :as => 'user_networks'

  get '/login' => 'sessions#new', :as => 'login'

  post '/sessions' => 'sessions#create'

  get '/logout' => 'sessions#destroy', :as => 'logout'

  get 'networks/:id/add_device' => 'networks#add_device_form'

  post 'networks/:id/add_device' => 'networks#add_device'

  delete '/connections/:id' => 'connections#destroy', :as => 'delete_connection'

end
