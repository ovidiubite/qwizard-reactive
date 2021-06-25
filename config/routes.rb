Rails.application.routes.draw do
  root 'lobbies#index'
  get 'lobbies/finished', to: 'lobbies#finished', as: :finished_lobbies

  devise_for :users
  resources :players
  resources :lobbies
  resources :answers
  resources :quizzes do
    resources :questions
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
