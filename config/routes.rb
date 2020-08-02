Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "characters#index"
  resources :sheets, only: [:index, :new, :create]
  resources :characters, only: [:index, :new, :create, :update] do
    member do
      get 'define_game'
    end
  end
  resources :games, only: [:new, :create]
  resources :masters, only: [:index, :new, :create]
end
