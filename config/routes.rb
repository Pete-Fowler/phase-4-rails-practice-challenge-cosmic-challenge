Rails.application.routes.draw do
  resources :planets
  resources :missions, only: [:create]
  resources :scientists

end
