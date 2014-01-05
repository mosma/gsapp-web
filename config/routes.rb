GsappWeb::Application.routes.draw do
  root 'home#index'
  get 'index' => 'home#index'
  get 'about' => 'home#about'
  get 'terms' => 'home#terms'
  get 'faq' => 'home#faq'
  get 'contact' => 'home#contact'
  
  devise_for :users

end
