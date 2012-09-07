class HomeController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!, :except => [:index]

  def index
    @users = User.all
    @plans = Plan.all

    @articles = Article.all
    @comments = Comment.all

  end

end
