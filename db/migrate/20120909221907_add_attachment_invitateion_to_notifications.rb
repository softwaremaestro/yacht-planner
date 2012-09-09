class AddAttachmentInvitateionToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :plan_invitation_id, :integer
  end
end
