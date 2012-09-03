class AddInvitableToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :invitable, :string
  end
end
