class DishGroup < ApplicationRecord
  acts_as_list
  
  has_many :dishes, dependent: :restrict_with_error
  
  mount_uploaders :images, DishImageUploader
  
  validates :name, presence: true

  default_scope { order("position asc") }
  
  before_create do
    self.position ||= self.class.all.size + 1
  end
  
  before_destroy do
    self.remove_from_list
  end
end 