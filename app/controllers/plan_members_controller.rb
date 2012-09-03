class PlanMembersController < ApplicationController

  def create
    @planMember = PlanMember.new(params[:plan_member])

    if @planMember.save
      respond_to do |format|
        format.js
      end
    else
      redirect_to "/plans/"+@planMember.plan_id.to_s+"/edit", notice: 'plan member was failed.'
    end

  end


end
