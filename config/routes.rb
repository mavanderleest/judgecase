Rails.application.routes.draw do
  root   'pages#home'
  get    '/businesses',    to: 'pages#businesses'
end
