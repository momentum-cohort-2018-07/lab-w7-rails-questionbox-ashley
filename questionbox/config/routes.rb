Rails.application.routes.draw do
  resources :users, only: [:new, :show, :create]
  resources :session, only: [:create, :destroy]

  resources :questions do
    resources :answers
  
  root 'questions#index'

  namespace :api do
    namespace :v1 do
      resources :questions do
        resources :answers
      end 
      resources :users
      resource :session, only: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
  end
end
end
