#encoding: utf-8
class PlansController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!, :except => [:index]

  def show

    @plan= Plan.find(params[:id])

    @planMember = PlanMember.where("plan_id = #{@plan.id}").find_by_user_id(current_user.id)
    #pm이 없으면, 권한이 없다는것. 플랜으로 빼고 에러처리.
    if @planMember

    else
      redirect_to "/plans", alert: '해당 그룹을 볼 권한이 없습니다.'
    end

    @sub_category_id = params[:sub_category]
    @sub_categories = @plan.sub_categories.all.map { |r| [r.title, r.id] }
    @sub_categories.delete_at(0)

    @articles = @plan.articles.order("updated_at desc").includes(:user, :comments)
    if params[:plink]
      article = Article.where("plan_id = #{params[:id]}").find(params[:plink])
      #에러 처리 어떻게 해야하지?
      if article
        @articles = @articles.where("articles.id <= #{article.id}")
      end
    end
    @articles = @articles.page(params[:page]).per(2)
    @articles = @articles.of_sub_category(@sub_category_id) unless @sub_category_id.nil?

    @planInvitation = PlanInvitation.new
    @article = Article.new
    @comment = Comment.new

    # model_name for nilClass.

    #@planMember = PlanMember.find_all_by_user_id(current_user.id).first

  end

  def edit
    @plan= Plan.where("id=#{params[:id]}").find_by_user_id(current_user.id)

    if @plan

    else
      redirect_to "/plans", alert: '해당 그룹을 수정 할 권한이 없습니다.'
    end



    @planInvitations = PlanInvitation.includes(:user).where("invite_id is null").find_all_by_plan_id(params[:id])


    @planMember = PlanMember.new




  end

  def index
    @planInvitation = PlanInvitation.new
    @plans= Plan.all

  end

  def create

    attrs={}


    #입력되는 처음 카테고리는, 로그 카테고리가 되어야함.
    params[:plan][:sub_categories_attributes].values.each_with_index do |v,index|
      if index==0 and v[:title]!="로그"
        attrs[0]={:title=>"로그", :_destroy=>""}
        attrs[index+1]=v
      else
        attrs[index+1]=v
      end
    end
    params[:plan][:sub_categories_attributes]=attrs
    #---------------------------------------------------



    @plan = Plan.new(params[:plan])
    @plan.user_id = current_user.id


    respond_to do |format|
      if @plan.save
        PlanMember.create({:plan_id => @plan.id, :user_id => current_user.id.to_s})
        format.html { redirect_to @plan, notice: 'Plan was successfully created.' }
      else
        format.html { render action: "new" , status: :unprocessable_entity }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end

  end
end
