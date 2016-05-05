Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'resume', to: 'pages#resume'
  get 'blog', to: 'pages#blog'
  get 'pdf', to: 'pages#pdf'
  get 'ekosea', to: 'pages#ekosea'
  get 'lesalon', to: 'pages#lesalon'
  get 'komodo', to: 'pages#komodo'
end
