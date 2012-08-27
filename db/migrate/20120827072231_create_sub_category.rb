class CreateSubCategory < ActiveRecord::Migration
  def change
    create_table :sub_category do |t|
      t.integer :plan_id
      t.string :title

      t.timestamps
    end
  end
end
