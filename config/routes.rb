Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  get 'home/index'
  resources :images do
    resources :comments
  end

  root to: "home#index"
  default_url_options :host => "localhost:3000"
end
