Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  get '/player/new'=>'players#new'
  get '/player'=>'players#playersIndex'
  get '/player/login'=>'players#login'
  get '/player/logout'=>'players#destroy'
  post 'player/login'=>'players#signIn'
  post '/player/new'=>'players#create'

end
