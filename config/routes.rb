Rails.application.routes.draw do

  root 'posts#index'

  resources :posts, only: [:index]
  resource :session, only: [:new, :create]

end
