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
  resources :articles
  resources :comments
  resources :plan_invitations
  resources :plan_members
  resources :notifications, :only => :index
  resources :like_articles


  #match ':controller/:action/:id/sub_category/:sub_category'


  match 'plans/:id/sub_category/:sub_category' => 'plans#show', :constraints => {:sub_category => /\d+/}
  match 'plans/:id/members' => 'plan_members#show', constraints: {id: /\d+/}

  match 'notifications/:id' => 'notifications#view', constraints: {id: /\d+/}

  #match 'plan_invitations/:id' => 'plan_invitations#invite', constraints: {id: /\d+/}


end
