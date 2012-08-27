class CreateComment < ActiveRecord::Migration

  def change
    create_table :comment do |t|
      t.integer :article_id
      t.integer :user_id

      t.text :content

      t.timestamp
    end
  end

end
