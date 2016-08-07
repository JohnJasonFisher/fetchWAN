Rails.application.routes.draw do
  get '/cards' => 'cards#index'
  get '/cards/:id' => 'cards#show'
end
