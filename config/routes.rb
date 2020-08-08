Rails.application.routes.draw do
  devise_for :users, except: :create, path: '', path_names: { sign_in: 'login', sign_out: 'signed-out' },
    controllers: {
    confirmations: 'confirmations'
    
  }
  resource :users

  get 'home/index'
  resources :images do
    resources :comments
    member do
      put 'like' => 'images#like'
      
    end
  end

  root to: "home#index"
  default_url_options :host => "localhost:3000"
end
