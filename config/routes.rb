Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "users/current" => "users#show"
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  get "/financial_assets" => "financial_assets#index"
  get "/financial_assets/:id" => "financial_assets#show"
  post "/financial_assets" => "financial_assets#create"
  patch "/financial_assets/:id" => "financial_assets#update"
  delete "/financial_assets/:id" => "financial_assets#destroy"
  
  get "/transactions" => "transactions#index"
  get "/transactions/:id" => "transactions#show"
  post "/transactions" => "transactions#create"
  patch "/transactions/:id" => "transactions#update"

  # Defines the root path route ("/")
  # root "posts#index"
end
