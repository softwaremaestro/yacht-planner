class RenameSubCategory < ActiveRecord::Migration
  def up
    rename_table :sub_categorys, :sub_categories
  end

  def down
    rename_table :sub_categories, :sub_categorys
  end
end
