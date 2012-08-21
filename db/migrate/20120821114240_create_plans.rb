class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.belongs_to :user
      t.string :title
      t.text :description
      t.boolean :public
      t.timestamps
    end

    add_attachment :plans, :cover
  end
end