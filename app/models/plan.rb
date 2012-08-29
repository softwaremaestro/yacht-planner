class Plan < ActiveRecord::Base
  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates :title, :presence => true

  has_many :sub_categories, :dependent => :destroy

  accepts_nested_attributes_for :sub_categories, :allow_destroy => true

  def prepare_form
    self.sub_categories.build

    return self
  end
end
