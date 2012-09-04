class PlanMembersController < ApplicationController

  def create
    @planMember = PlanMember.new(params[:plan_member])

    if @planMember.save
      pi = PlanInvitation.where( :plan_id => @planMember.plan_id,:user_id => @planMember.user_id)
      pi.each do |p|
        p.destroy
      end


      respond_to do |format|
        format.js
      end
    else
      redirect_to "/plans/"+@planMember.plan_id.to_s+"/edit", notice: 'plan member was failed.'
    end

  end

  def show
    @planMembers = PlanMember.find_all_by_plan_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @planMembers }
    end
  end

end
