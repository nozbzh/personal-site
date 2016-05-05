Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'resume', to: 'pages#resume'
  get 'blog', to: 'pages#blog'
  get 'pdf', to: 'pages#pdf'
  get 'ekosea', to: 'pages#ekosea'
  get 'lesalon', to: 'pages#lesalon'
  get 'komodo', to: 'pages#komodo'
end
