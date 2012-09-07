class Article < ActiveRecord::Base
  belongs_to :sub_category
  belongs_to :user
  belongs_to :plan

  has_many :comments,  :dependent => :destroy

  # for paginate.
  def self.of_sub_category s_id
    where(:sub_category_id => s_id)
  end

end