class Newsfeed < ActiveRecord::Base

  belongs_to :user
  belongs_to :article
  belongs_to :comment ,:include => :article
  belongs_to :plan
  belongs_to :sub_category

#  has_many :plan_members , :through => :user
#  has_many :plans , :through => :plan_members
#  has_many :sub_categories ,:through => :plans
#  has_many :articles ,:through => :sub_categories
#  has_many :comments ,:through => :articles

end