#encoding: utf-8
class PlanInvitationsController < ApplicationController

  def create
    if params[:plan_invitation][:email]
      @plan= Plan.find(params[:plan_invitation][:plan_id])

      @planMember = PlanMember.where("plan_id = #{@plan.id}").find_by_user_id(current_user.id)
      #pm이 없으면, 권한이 없다는것. 플랜으로 빼고 에러처리.
      if @planMember

      else
        redirect_to "/plans/"+@plan.id.to_s, alert: '회원을 초대 할 권한이 없습니다.'
      end

      @user = User.find_by_email(params[:plan_invitation][:email])


      @planInvitation = PlanInvitation.new({:user_id => @user.id,:invite_id => current_user.id,:plan_id => @plan.id})

      #관리자 또는, 회원들이 초대를 할 수 있음.

      if @planInvitation.save
        article = Article.create! :content =>(current_user.name + ' 님이'+@user.name + '님을 초대 했습니다.'), :plan_id =>@planInvitation.plan_id,:sub_category_id=>@planInvitation.plan.sub_categories.first.id,:user_id=>current_user.id
        ntf = Notification.new :article_id => article.id , :plan_id => article.plan_id ,:user_id => @user.id, :c_type => 4,:plan_invitation_id =>@planInvitation.id
        ntf.save

        #plan 새로 만들때, admin user 넣어줘야함. 지금은 안넣고있음.

        respond_to do |format|
          format.html {redirect_to "/plans/", notice: 'invitation was successfully created.' }
          format.js
        end
      else
        redirect_to "/plans/", notice: 'invitation was failed.'
      end

    else

      @planInvitation = PlanInvitation.new(params[:plan_invitation])
      @planInvitation.user_id = current_user.id

      #관리자 또는, 회원들이 초대를 할 수 있음.

      if @planInvitation.save
        article = Article.create! :content =>(current_user.name + '님이 가입 신청을 했습니다.'), :plan_id =>@planInvitation.plan_id,:sub_category_id=>@planInvitation.plan.sub_categories.first.id,:user_id=>@planInvitation.user_id
        ntf = Notification.new :article_id => article.id , :plan_id => article.plan_id ,:user_id => article.plan.user_id, :c_type => 3
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
