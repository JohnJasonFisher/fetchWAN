Rails.application.routes.draw do
  get '/fetchWAN' => 'cards#index'
end
