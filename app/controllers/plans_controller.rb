class PlansController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!, :except => [:index]

  def show

    @plan= Plan.find(params[:id])

    @sub_category_id = params[:sub_category]


    if @sub_category_id
      @articles = @plan.sub_categories.find(@sub_category_id).articles.includes(:user,:comments).all(order:"updated_at desc")
    else
      @articles = @plan.articles.includes(:user,:comments).all(order:"updated_at desc")
    end

    @article = Article.new
    @comment = Comment.new

    # 라우팅 수정 해야함. 지금은 꼼수로 받았음.

    #@pi = params[:id]

    #@plan.sub_category.article

  end
end
