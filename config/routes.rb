Rails.application.routes.draw do
  resources :requests, path: :client
  resources :units, path: :uf
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
