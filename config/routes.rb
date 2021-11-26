Rails.application.routes.draw do

  devise_for :users

  resources :cards  

  resources :users
  get 'users/show', to: "users#show"
  
  root to: "home#index"

  get "/buy/:card_id", to: "checkout#buy", as: "buy"
  get "/success", to: "checkout#success", as: "success"
  get "/cancel", to: "checkout#cancel", as: "cancel"

end
