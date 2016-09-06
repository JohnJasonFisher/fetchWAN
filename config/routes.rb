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

  get '/alert' => 'alert#alert_seller'
end

# 1. Generate fake price data about Goyf.
# 2. Let current price always be equal to most current price in price data table
# 3. Set up API job.