Rails.application.routes.draw do
  resources :participants, :invites
  get 'participants/new' => 'participants#new'
  get '/email' => 'participants#email'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end