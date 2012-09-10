class LikeArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])

    @planMember = PlanMember.where("plan_id = #{@article.plan_id}").find_by_user_id(current_user.id)
    #pm이 없으면, 권한이 없다는것. 플랜으로 빼고 에러처리.
    if @planMember
      likeArticle = LikeArticle.where("user_id = #{current_user.id}").find_by_article_id(@article.id)
      if likeArticle
        likeArticle.destroy
        #존재하면 삭제해서, 비추천으로 돌린다.
      else
        #없으면, 만들어서 추천.
        likeArticle = LikeArticle.new(:user_id => current_user.id, :article_id => @article.id)
        likeArticle.save
      end
      @article = Article.find(params[:id])
    else
      #권한이 없음.
    end

  end
end
