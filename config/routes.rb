Myapp::Application.routes.draw do
  resources :posts
  resources :plans
#  resources :plans do
#    resources :sub_categories
#  end


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
  resources :articles, :only => [:new, :update,:create]

  #match ':controller/:action/:id/sub_category/:sub_category'


  match 'plans/:id/sub_category/:sub_category' => 'plans#show', :constraints => {:sub_category => /\d+/}
end
