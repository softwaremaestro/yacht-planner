#encoding: utf-8
class PlanMembersController < ApplicationController
  before_filter :authenticate_user!
  def create

    #그룹 어드민만 가입 시킬 수 있어야 함.

    @plan = Plan.where("id = #{params[:plan_member][:plan_id]}").find_by_user_id(current_user.id)
    @planInvitation = PlanInvitation.where("plan_id = #{params[:plan_member][:plan_id]} and invite_id is not null").find_by_user_id(current_user.id)
    if @plan or @planInvitation

    else
      redirect_to "/plans", alert: '그룹에 가입 할 권한이 없습니다.'
    end

    @planMember = PlanMember.new(params[:plan_member])

    if @planMember.save
      PlanInvitation.where(plan_id: @planMember.plan_id,user_id: @planMember.user_id).each do |p|
        @planInvitation =p
        p.destroy
      end

      article = Article.create! :content =>(current_user.name + '님이 가입 했습니다.'), :plan_id =>@planMember.plan_id,:sub_category_id=>@planMember.plan.sub_categories.first.id,:user_id=>@planMember.user_id
      Newsfeed.feed(article)

      respond_to do |format|
        format.js
      end
    else
      redirect_to "/plans/"+@planMember.plan_id.to_s+"/edit", notice: 'plan member was failed.'
    end

  end

  def show
    @planMembers = PlanMember.includes(:user).find_all_by_plan_id(params[:id])
    @plan = Plan.find(params[:id])

    @planMember = PlanMember.where("plan_id = #{@plan.id}").find_by_user_id(current_user.id)
    #pm이 없으면, 권한이 없다는것. 플랜으로 빼고 에러처리.
    #!! 그룹의 설정에 따라, 어드민만 보게 하는 기능이 필요함.
    if @planMember

    else
      redirect_to "/plans", alert: '그룹 맴버를 볼 권한이 없습니다.'
    end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @planMembers }
    end
  end

  def destroy

    @planMember = PlanMember.find(params[:id])
    #스코프 처리 해줘야 함. 해당 플랜의 어드민 일 경우, 본인일 경우, 삭제.

    @plan = Plan.find(@planMember.plan_id)

      if @plan.user_id==current_user.id
        @planMember.destroy

        respond_to do |format|
          format.html { redirect_to "/plans/"+@planMember.plan_id.to_s + "/members" }
          format.js
        end
      elsif @planMember.user_id==current_user.id
        @planMember.destroy

        respond_to do |format|
          format.html { redirect_to "/plans/"+@planMember.plan_id.to_s }
          format.js
        end
    else
      return
    end


  end

end
