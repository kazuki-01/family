Rails.application.routes.draw do
  devise_for :users, module: "users"
  
  root 'home#top'
  get 'home/top'

  devise_scope :user do
    post 'users/check' => 'users/registrations#check'
  end
  
  get 'posts/index'
  get 'posts/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
