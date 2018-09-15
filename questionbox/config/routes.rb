Rails.application.routes.draw do
  resources :questions
  resources :answers, only: [:new, :index, :create]
  resources :users, only: [:new, :create]
  resources :session, only: [:create, :destroy]

  root 'questions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
