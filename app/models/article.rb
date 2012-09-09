class Article < ActiveRecord::Base
  belongs_to :sub_category
  belongs_to :user
  belongs_to :plan

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  attr_accessible :image,:content, :public, :plan_id, :sub_category_id,:user_id


  has_many :comments,  :dependent => :destroy

  # for paginate.
  def self.of_sub_category s_id
    where(:sub_category_id => s_id)
  end

end