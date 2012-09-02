class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id

    if @comment.save
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
