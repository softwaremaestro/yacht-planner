class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :plan_id
      t.integer :sub_category_id
      t.integer :article_id
      t.integer :comment_id
      t.integer :c_type
      t.boolean :view , :null => false, :default => false
      t.timestamps
    end
  end
end
