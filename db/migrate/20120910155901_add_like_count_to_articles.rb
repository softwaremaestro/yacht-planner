class AddLikeCountToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :like_articles_count, :integer, :default => 0
  end

  def self.down
    remove_column :articles, :like_articles_count
  end
end
