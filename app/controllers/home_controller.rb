class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @users = User.all

    ps = PlanMember.select("DISTINCT plan_id").find_all_by_user_id(current_user.id).map{|p| p.plan_id}
    #로그인한 유저가 가입한 플랜 리스트를 가져옴.

    @newsfeeds = Newsfeed.order("updated_at desc").includes(:user,{:article => {:comments => :user}},:sub_category).find_all_by_plan_id([ps])
    #? article 내부에 있는 comment와,user 정보들은, 이렇게 리퀘스트 날리면 쿼리가 한방에 호출되지 않을것 같다. 테스트및 최적화 필요함.
    #? belong_to와 has_many를 동시에 못사용할까? 하고싶은것, newsfeed는 article에 있는 여러 comments를 갖는다. 라고 모델에 명시 하고 싶다.

    #@user = Article.find(1).comments.includes(:user)

    #@a = @user.first
    #@user = Newsfeed.find_all_by_user_id(1).first
    #@user = @user.inspect

    @comment = Comment.new

  end
end
