Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/' => 'static#home'

  resources :networks

  resources :devices

  get 'networks/:id/add_device' => 'networks#add_device_form'

  post 'networks/:id/add_device' => 'networks#add_device'

  delete '/connections/:id' => 'connections#destroy', :as => 'delete_connection'

end
