class CreateArticle < ActiveRecord::Migration
  def change
    create_table :article do |t|
      t.integer :plan_id
      t.integer :sub_category_id
      t.integer :user_id

      t.text :content

      t.timestamp
    end

  end
end
