class CreatePlanInvitations < ActiveRecord::Migration
  def change
    create_table :plan_invitations do |t|
      t.integer :plan_id
      t.integer :user_id
      t.integer :invite_id

      t.timestamps
    end
  end
end
