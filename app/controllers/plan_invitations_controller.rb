class PlanInvitationsController < ApplicationController

  def create
    @planInvitation = PlanInvitation.new(params[:plan_invitation])
    @planInvitation.user_id = current_user.id

    if @planInvitation.save
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
