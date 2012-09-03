class PlansController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!, :except => [:index]

  def show

    @plan= Plan.find(params[:id])

    @sub_category_id = params[:sub_category]

    @articles = @plan.articles.order("updated_at desc").includes(:user, :comments).page(params[:page]).per(2)
    @articles = @articles.of_sub_category(@sub_category_id) unless @sub_category_id.nil?

    #if @sub_category_id
    #  @articles = @plan.sub_categories.find(@sub_category_id).articles.includes(:user,:comments).all(order:"updated_at desc")
    #else
    #  @articles = @plan.articles.includes(:user,:comments).all(order:"updated_at desc")
    #end

    @article = Article.new
    @comment = Comment.new

    # model_name for nilClass.

  end

  def edit
    @plan= Plan.find(params[:id])

    @planInvitations = PlanInvitation.includes(:user).find_all_by_plan_id(params[:id])


  end

  def index
    @planInvitation = PlanInvitation.new
    @plans= Plan.all

  end

end
