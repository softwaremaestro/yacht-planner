class ArticlesController < ApplicationController
  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id

    if @article.save
      respond_to do |format|
        format.html {redirect_to "/plans/"+@article.plan_id.to_s, notice: 'article was successfully created.' }
        format.js
      end
    else
      redirect_to "/plans/"+@article.plan_id.to_s, notice: 'article was failed.'
    end

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to plans_url }
      format.js
    end
  end
end
