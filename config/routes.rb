Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      #merchants
      namespace :merchants do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/items', to: 'items#index'
        get '/most_revenue', to: 'most_revenue#index'
        get '/random', to: 'random#show'
      end

      resources :merchants, only: [:index, :show]

      #items
      namespace :items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/merchant', to: 'merchant#show'
      end

      resources :items, only: [:index, :show]

      #customers
      namespace :customers do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/transactions', to: 'transactions#index'
      end

      resources :customers, only: [:index, :show]

      #invoices
      namespace :invoices do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/items', to: 'items#index'
        get '/:id/customer', to: 'customer#index'
      end

      resources :invoices, only: [:index, :show]
    end
  end
end