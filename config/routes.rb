Rails.application.routes.draw do
  root                        to: 'pages#home'
  match '/businesses',        to: 'pages#businesses',       via: 'get'

  # message routes
  match 'contact-us',         to: 'messages#new',          via: 'get',          as: 'new_message'
  match 'contact-us',         to: 'messages#create',       via: 'post',         as: 'create_message'

  # catch variant routes
  match '/home',              to: 'pages#home',             via: 'get'
  match '/pages/home',        to: 'pages#home',             via: 'get'
  match '/pages/businesses',  to: 'pages#businesses',       via: 'get'
end
