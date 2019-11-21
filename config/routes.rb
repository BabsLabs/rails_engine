Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get "/merchants/find", to: "merchants#find"
      get "/merchants/find_all", to: "merchants#find_all"
      get "/merchants/random", to: "merchants#random"
      get "/merchants/most_revenue", to: "merchants#most_revenue"
      get "/merchants/:id/items", to: "merchants/items#index"
      get "/merchants/:id/invoices", to: "merchants/invoices#index"
      resources :merchants, only: [:index, :show]

      resources :items, only: [:index]
    end
  end

end
