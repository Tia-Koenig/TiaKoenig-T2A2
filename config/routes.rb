Rails.application.routes.draw do

  devise_for :users

  resources :cards
  
  root to: "home#index"

end
