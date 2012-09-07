class PlanInvitationsController < ApplicationController

  def create
    @planInvitation = PlanInvitation.new(params[:plan_invitation])
    @planInvitation.user_id = current_user.id

    if @planInvitation.save
      article = Article.create! :content =>current_user.name + '님이 가입 신청을 했습니다.', :plan_id =>@planInvitation.plan_id,:sub_category_id=>'-1',:user_id=>@planInvitation.user_id
      ntf = Notification.new :article_id => article.id , :plan_id => article.plan_id ,:user_id => article.plan.user_id
      ntf.save

      #plan 새로 만들때, admin user 넣어줘야함. 지금은 안넣고있음.

      respond_to do |format|
        format.html {redirect_to "/plans/", notice: 'invitation was successfully created.' }
        format.js
      end
    else
      redirect_to "/plans/", notice: 'invitation was failed.'
    end

  end

  def destroy
    @planInvitation = PlanInvitation.find(params[:id])
    @planInvitation.destroy

    respond_to do |format|
      format.html { redirect_to plans_url }
      format.js
    end
  end
end
