class HomeController < ApplicationController
  def index
    @users = User.all

    ps = PlanMember.select("DISTINCT plan_id").find_all_by_user_id(current_user.id).map{|p| p.plan_id}
    #로그인한 유저가 가입한 플랜 리스트를 가져옴.
    @newsfeeds = Newsfeed.order("updated_at desc").includes(:user,{:article => {:comments => :user}},:sub_category).find_all_by_plan_id([ps])

  end
end
