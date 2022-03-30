Rails.application.routes.draw do
  resources :words
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "words#new"
   get 'post'=>'post#index'
  get 'post/index'=>'post#index'
end
