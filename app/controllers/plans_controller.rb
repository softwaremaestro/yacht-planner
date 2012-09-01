class PlansController < ApplicationController
  inherit_resources



  def show

    @plan= Plan.find(params[:id])

    @sub_category_id = params[:sub_category]


    if @sub_category_id == "" || @sub_category_id == nil
      @articles = @plan.articles
    else
      @articles = @plan.sub_categories.find(@sub_category_id).articles
    end

    @article = Article.new

    # 라우팅 수정 해야함. 지금은 꼼수로 받았음.

    #@pi = params[:id]

    #@plan.sub_category.article

  end
end
