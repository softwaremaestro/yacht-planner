class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categorys do |t|
      t.integer :plan_id
      t.string :title

      t.timestamps
    end
  end
end
