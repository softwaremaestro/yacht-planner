class Plan < ActiveRecord::Base
  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  attr_accessible :cover,:title, :description, :public, :sub_categories_attributes

  validates :title, :presence => true

  has_many :sub_categories, :dependent => :destroy
  has_many :articles, :through => :sub_categories
  has_many :comments, :through => :articles

  validates :sub_categories, :length => {:minimum => 3}
  accepts_nested_attributes_for :sub_categories, :allow_destroy => true
  accepts_nested_attributes_for :articles, :allow_destroy => true
  accepts_nested_attributes_for :comments, :allow_destroy => true

  #attr_accessible :article

end
