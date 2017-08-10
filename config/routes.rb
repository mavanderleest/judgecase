Rails.application.routes.draw do
  root   'pages#home'
  get    '/businesses',         to: 'pages#businesses'
  get    'pages/businesses',    to: redirect('/businesses')
end
