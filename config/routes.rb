Myapp::Application.routes.draw do
  resources :posts
  resources :plans

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  #devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :users, :only => [:show, :index]
  resources :articles
  resources :comments
  resources :members

  match 'plans/:id/sub_category/:sub_category' => 'plans#show', :constraints => {:sub_category => /\d+/}



end
