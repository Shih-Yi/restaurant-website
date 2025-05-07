class DishGroupImage < ApplicationRecord
  belongs_to :dish_group
  
  mount_uploader :image, DishImageUploader
  
  acts_as_list scope: :dish_group
  
  validates :image, presence: true
  
  before_create do
    self.position ||= self.class.where(dish_group_id: dish_group_id).size + 1
  end
  
  before_destroy do
    self.remove_from_list
  end
end 