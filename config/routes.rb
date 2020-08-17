Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  root to: "home#index"
  resources :sheets, only: [:new, :create, :show, :update] do
    member do
      get 'define_character_type'
      get 'characteristics_form'
      post 'characteristics'
      post 'update_player_attributes'
    end
  end
  resources :characters, only: [:index, :new, :create, :update] do
    member do
      get 'define_game'
    end
  end
  resources :games, only: [:new, :create]
  resources :masters, only: [:index, :new, :create] do

  end
end
