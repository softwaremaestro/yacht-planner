class Newsfeed < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  belongs_to :comment ,:include => :article
  belongs_to :plan
  belongs_to :sub_category
end