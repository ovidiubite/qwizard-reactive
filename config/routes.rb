require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'lobbies#index'
  get 'lobbies/finished', to: 'lobbies#finished', as: :finished_lobbies
  get 'user_settings', to: 'user_settings#edit', as: :edit_user_settings
  patch 'user_settings', to: 'user_settings#update', as: :update_user_settings
  delete :logout, to: 'sessions#logout'


  resources :players
  resources :lobbies do
    post :join
    get :pregame
    post :start
    post :answer
  end

  resources :answers
  resources :quizzes do
    resources :questions do
      get 'suggest_question', action: :suggest_question, on: :collection
    end
  end
  resources :sessions, only: [:new, :create]
  resources :registrations, only: [:new, :create]
  resources :passwords, except: [:index, :show, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
