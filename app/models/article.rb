class Article < ActiveRecord::Base
  belongs_to :sub_category
  belongs_to :user

  has_many :comments,  :dependent => :destroy

end

