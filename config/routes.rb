Rails.application.routes.draw do
  get '/usercards' => 'usercards#index'
  get '/usercards/portfolio' => 'usercards#portfolio'
  
  get '/cards/:id' => 'cards#show'
  
  delete '/cards/:id' => 'card_user#destroy'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout/' => 'sessions#destroy'

  get '/cardusers/new' => 'card_users#new'
  post '/cardusers' => 'card_users#create'
end
