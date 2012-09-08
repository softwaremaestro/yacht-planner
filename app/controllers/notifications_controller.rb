class NotificationsController < ApplicationController

  def index

    @users = User.all
  #  @newsfeeds = Newsfeed.order("updated_at desc").includes(:user,{:article => {:comments => :user}},:sub_category).find_all_by_plan_id([ps])
    @notifications = Notification.order("updated_at desc").includes(:user,{:article => {:comments => :user}},:sub_category,{:comment => :user}).find_all_by_user_id(current_user.id)
#    @notifications = Notification.all.inspect

  end

  def view
   Notification.where(:user_id => current_user.id.to_s).update_all(:view => true)
  end

end
