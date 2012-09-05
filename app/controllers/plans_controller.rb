class PlansController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!, :except => [:index]

  def show

    @plan= Plan.find(params[:id])

    @sub_category_id = params[:sub_category]

    @articles = @plan.articles.order("updated_at desc").includes(:user, :comments).page(params[:page]).per(2)
    @articles = @articles.of_sub_category(@sub_category_id) unless @sub_category_id.nil?





    @article = Article.new
    @comment = Comment.new

    # model_name for nilClass.

    @planMember = PlanMember.find_all_by_user_id(current_user.id).first

  end

  def edit
    @plan= Plan.find(params[:id])

    @planInvitations = PlanInvitation.includes(:user).find_all_by_plan_id(params[:id])

    @planMember = PlanMember.new


  end

  def index
    @planInvitation = PlanInvitation.new
    @plans= Plan.all

  end

end
