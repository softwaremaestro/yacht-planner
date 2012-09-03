class SubCategory < ActiveRecord::Base
  belongs_to :plan

  has_many :articles,  :dependent => :destroy

  validates :title, :presence => true
end
