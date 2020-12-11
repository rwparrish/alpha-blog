Rails.application.routes.draw do
  get 'pages/home'
  root 'pages#home'
  get 'about', to: 'pages#about'
end
