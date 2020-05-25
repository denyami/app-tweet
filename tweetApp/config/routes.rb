Rails.application.routes.draw do
  root to: 'tweets#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/tweets/own_tweets', to:'tweets#own_tweets'
  resources :tweets
  get 'users/index'
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
