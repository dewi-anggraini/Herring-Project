Rails.application.routes.draw do
  resources :posts
  resources :comments, only: [:create, :index, :show, :edit, :update, :destroy]    
   
  devise_for :users, :controllers => { registrations: "users/registrations", 
  sessions: "users/sessions" }

  delete "users/delete_account", to: "users/registrations#delete_account", as: :delete_account_user
  

  root "home#index"
  #get 'home/index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  #get "posts#index"
  #get "comments#index"
end
