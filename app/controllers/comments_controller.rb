class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id

    if @comment.save

      #아티클에 코맨트를 단 유저들 리스트를, 중복 제거하여 뽑아와서 for문을 돌며, 날려줌.
      chash={}
      @comment.article.comments.map{|c| chash[c.user_id]=c}
      chash.each do |key,value|
        if value.user.id==@comment.user.id
          next
        end
        ntf = Notification.new :article_id => value.article.id , :plan_id => value.article.plan_id , :sub_category_id => value.article.sub_category_id,:user_id => value.user_id, :c_type=>1     #-> 1
        ntf.save

      end

      #아티클을 쓴 사람에게, 노티파이를 날려줌.
      article = @comment.article
      ntf = Notification.new :article_id => article.id , :plan_id => article.plan_id ,:user_id => article.user_id, :sub_category_id => article.sub_category_id, :c_type=>0
      # -> 0
      ntf.save



      respond_to do |format|
        format.html {redirect_to "/plans/", notice: 'comment was successfully created.' }
        format.js
      end
    else
      redirect_to "/plans/", notice: 'comment was failed.'
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to plans_url }
      format.js
    end
  end
end
