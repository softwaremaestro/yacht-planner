class Notification < ActiveRecord::Base

  belongs_to :user
  belongs_to :article
  belongs_to :plan
  belongs_to :sub_category
  belongs_to :comment

end
