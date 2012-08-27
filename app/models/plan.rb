class Plan < ActiveRecord::Base
  has_attached_file :cover, :styles => { :medium => "870x400>", :thumb => "300x200>" }

  validates :title, :presence => true
end