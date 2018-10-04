Rails.application.routes.draw do


  root 'pages#home'
  get 'pages/home'
  get 'pages/about'
  get '/about' => 'pages#about'
  get '/home' => 'pages#home'
  get '/credits' => 'pages#credits'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
