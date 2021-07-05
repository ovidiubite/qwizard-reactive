Rails.application.routes.draw do
  root 'lobbies#index'
  get 'lobbies/finished', to: 'lobbies#finished', as: :finished_lobbies
  get 'user_settings', to: 'user_settings#edit', as: :edit_user_settings
  patch 'user_settings', to: 'user_settings#update', as: :update_user_settings


  resources :players
  resources :lobbies do
    post :join
    get :pregame
  end
  resources :answers
  resources :quizzes do
    resources :questions
  end
  resources :sessions, only: [:new, :create]
  resources :registrations, only: [:new, :create]
  resources :passwords, except: [:index, :show, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
