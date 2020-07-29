Rails.application.routes.draw do
  resources :participants
  get 'participants/new', to: 'participants#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
