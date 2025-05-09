class DishImage < ApplicationRecord
  belongs_to :dish
  
  mount_uploader :image, DishImageUploader
  
  validates :image, presence: true
  
  before_create do
    self.position ||= self.class.where(dish_id: dish_id).size + 1
  end
end 