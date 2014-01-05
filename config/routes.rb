GsappWeb::Application.routes.draw do

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
      resources :products
    end
  end

  get 'garages' => 'garage#index'
  get 'profile' => 'garage#edit'
  post 'profile' => 'garage#update'
  
  get ':name/:product/edit' => 'product#edit'
  post ':name/:product' => 'product#update'
  get ':name/:product' => 'product#show', as: :product
  
  post ':name' => 'garage#update'
  get ':name' => 'garage#show', as: :garage
  
end
