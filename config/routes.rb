Rails.application.routes.draw do
  post "/login", to: "authentication#login"
  post "/register", to: "authentication#register"
  get "/users/current", to: "users#show"
  resources :posts
end
