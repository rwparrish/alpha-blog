Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessiosn#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessiosn#destroy'
end
