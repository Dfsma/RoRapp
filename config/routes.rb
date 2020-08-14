Rails.application.routes.draw do
  
  get 'users/index'
  get 'home/index'
  root to: "home#index"
  


  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  resource :users

  resources :images do
    resources :comments
    member do
      put 'like' => 'images#like'
      
    end
  end
  get '*path' => redirect('/')
  default_url_options :host => "localhost:3000"
end
