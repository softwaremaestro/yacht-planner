class CreateNewsfeeds < ActiveRecord::Migration
  def change
    create_table :newsfeeds do |t|
      t.integer :user_id
      t.integer :plan_id
      t.integer :sub_category_id
      t.integer :article_id
      t.timestamps
    end
  end
end
