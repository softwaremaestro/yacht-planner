Myapp::Application.routes.draw do
  resources :posts
  resources :plans

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
  resources :articles
  resources :comments

  match 'plans/:id/sub_category/:sub_category' => 'plans#show', :constraints => {:sub_category => /\d+/}
end
