require 'sidekiq/web'

GsappWeb::Application.routes.draw do

  
  post "messages/:id" => 'messages#send', as: :send_message
  get "messages/:id" => 'messages#conversation', as: :conversation
  mount Sidekiq::Web => '/sidekiq'

  root 'home#index'

  get 'index' => 'home#index'
  get 'about' => 'home#about'
  get 'terms' => 'home#terms'
  get 'faq' => 'home#faq'
  get 'contact' => 'home#contact'
  
  devise_for :users, 
              controllers: { :omniauth_callbacks => 'users/omniauth_callbacks'}

 devise_scope :user do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
    get '/register' => "devise/registrations#new"
  end

  namespace :admin do
    resources :garages do
      resources :products do
        resources :medias
      end
    end
  end

  get "category" => "category#index"
  get "category/:id" => "category#show"

  get "search" => "search#index"
  get "search/:query" => "search#index"
  get "search/tags/:tag" => "search#tags"
  get "search/category/:category" => "search#category"

  get 'garages' => 'garage#index'

  resources :media

  get ':name/profile' => 'garage#edit', as: :profile
  patch ':name/profile' => 'garage#update'
  get ':name/localization' => 'garage#localization', as: :localization
  patch ':name/localization' => 'garage#update_localization'
  get ':name/statistics' => 'garage#statistics', as: :garage_statistics
  get ':name/integrations' => 'garage#integrations', as: :garage_integrations

  get ':name/products' => 'garage#products', as: :garage_products

  get ":name/promote" => 'promote#index', as: :promote
  get ":name/promote/social_networks" => 'promote#social_networks' , as: :promote_social_networks
  get ":name/promote/widget" => 'promote#widget' , as: :promote_widget
  get ":name/promote/takeone" => 'promote#takeone', as: :promote_takeone
  get ":name/promote/business_card" => 'promote#business_card', as: :business_card
  get ":name/promote/tag_price" => 'promote#tag_price', as: :tag_price

  get ':name/tags' => 'garage#tags', as: :garage_tags

  get ':name/like' => 'garage#like', as: :garage_like
  get ':name/unlike' => 'garage#unlike', as: :garage_unlike

  get ':name/new' => 'product#new', as: :new_product
  post ':name/new' => 'product#create'
  get ':name/:id/edit' => 'product#edit', as: :edit_product
  post ':name/:id' => 'product#update', as: :update_product
  patch ':name/:id' => 'product#update'
  get ':name/:id' => 'product#show', as: :product

  get ':name/:id/like' => 'product#like', as: :product_like
  get ':name/:id/unlike' => 'product#unlike', as: :product_unlike

  post ':name' => 'garage#update'
  get ':name' => 'garage#show', as: :garage
  
end
