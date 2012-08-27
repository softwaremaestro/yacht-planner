class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :plan_id
      t.integer :sub_category_id
      t.integer :user_id

      t.text :content

      t.timestamps
    end
  end
end
