Rails.application.routes.draw do

  root "restaurant#index"

  resources :restaurants do
    collection do
      get "top", to: "restaurants#top"
    end
    member do
      get "chef", to: "restaurants#chef"
    end
    resources :reviews, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :restaurants, only: [:index]
  end
end
