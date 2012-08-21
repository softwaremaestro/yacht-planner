class Plan < ActiveRecord::Base
  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates :title, :presence => true
end