class PlanMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan
  has_many :users
end
