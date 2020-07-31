Rails.application.routes.draw do
  resources :participants
  get 'participants/new' => 'participants#new'
  get '/winner' => 'participants#winner'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end