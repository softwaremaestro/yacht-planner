class Article < ActiveRecord::Base
  belongs_to :sub_category
  belongs_to :user
  belongs_to :plan

  has_many :comments,  :dependent => :destroy

  def self.of_sub_category subcategory_id
    where(:sub_category_id => subcategory_id)
  end
end

