Rails.application.routes.draw do
  #get 'post/index'

  get '/myposts/:user_id', to:'posts#myposts'
  
  devise_for :users
  
  # get '/mycomment/:comment_id',to:'comments#mycomment'
  post "mycomments/:comment_id" => "comments#mycomment", as: "mycomment"
  
  root 'posts#index'
  resources :posts do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  


  

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
