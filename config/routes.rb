Rails.application.routes.draw do
  get '/usercards' => 'usercards#index'
  get '/usercards/add' => 'usercards#new'
  post '/usercards/add' => 'usercards#create'
  
  get '/cards/:id' => 'cards#show'
  
  delete '/cards/:id' => 'card_user#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
