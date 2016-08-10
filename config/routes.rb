Rails.application.routes.draw do
  get '/cards' => 'cards#index'
  get '/cards/:id' => 'cards#show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout/' => 'sessions#destroy'

  get '/carduser/new' => 'card_users#new'
  post '/carduser/new' => 'card_users#create'
end
