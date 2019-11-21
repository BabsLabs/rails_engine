Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/merchants/random', to: 'merchants#random'
      get '/merchants/find', to: 'merchants#find'
      get '/merchants/find_all', to: 'merchants#find_all'
      get '/merchants/most_revenue', to: 'merchants#most_revenue'
      get '/merchants/:id/items', to: 'merchants/items#index'
      get '/merchants/:id/invoices', to: 'merchants/invoices#index'
      resources :merchants, only: [:index, :show]

      get '/items/random', to: 'items#random'
      get '/items/find', to: 'items#find'
      get '/items/find_all', to: 'items#find_all'
      resources :items, only: [:index, :show]
    end
  end

end
