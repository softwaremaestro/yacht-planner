class ArticlesController < ApplicationController
  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user

    if @article.save
      redirect_to "/plans/"+@article.plan_id.to_s, notice: 'article was successfully created.'
    else
      redirect_to "/plans/"+@article.plan_id.to_s, notice: 'article was failed.'
    end
  end
end
