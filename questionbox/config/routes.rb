Rails.application.routes.draw do
  resources :questions
  resources :answers
  resources :users, only: [:new, :show, :create]
  resources :session, only: [:create, :destroy]

  root 'questions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
