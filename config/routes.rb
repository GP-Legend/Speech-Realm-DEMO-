Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root 'pages#home'

   get 'pages/about'

   resources :topics do
     resources :comments
   end

end
