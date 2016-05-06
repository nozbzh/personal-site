Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'projects#index'
  get 'work/:slug', to: 'projects#show', as: :project

  get 'about', to: 'pages#about'
  get 'resume', to: 'pages#resume'
  get 'pdf', to: 'pages#pdf'

  get 'blog', to: 'posts#index'
  get 'blog/:slug', to: 'posts#show', as: :post
end
