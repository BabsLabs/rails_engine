Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/items', to: 'items#index'
        get '/most_revenue', to: 'most_revenue#index'
        get '/random', to: 'random#show'
      end


      resources :merchants, only: [:index, :show]

      get '/items/random', to: 'items#random'
      get '/items/find', to: 'items#find'
      get '/items/find_all', to: 'items#find_all'
      resources :items, only: [:index, :show]

    end
  end

end
