Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root                        to: 'pages#home'
  match '/businesses',        to: 'pages#businesses',       via: 'get'

  # message routes
  match 'contact-us',         to: 'messages#new',          via: 'get',          as: 'new_message'
  match 'contact-us',         to: 'messages#create',       via: 'post',         as: 'create_message'

  # catch variant routes
  match '/home',              to: 'pages#home',             via: 'get'
  match '/pages/home',        to: 'pages#home',             via: 'get'
  match '/pages/businesses',  to: 'pages#businesses',       via: 'get'

  resources :posts,           path: '/blog'
end
