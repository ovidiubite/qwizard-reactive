Rails.application.routes.draw do
  root 'lobbies#index'
  
  devise_for :users
  resources :players
  resources :lobbies
  resources :answers
  resources :quizzes
  resources :questions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
