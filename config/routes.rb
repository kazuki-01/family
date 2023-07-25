Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
                     #ユーザー更新するときに、after_update_path_forを有効にする
  
  root 'home#top'

  devise_scope :user do
    post 'users/check' => 'users/registrations#check'
  end
  resources :posts
  resources :weeklies

  get 'dones/new' => 'dones#new'
  post 'dones/create' => 'dones#create'

  resources :chats

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
