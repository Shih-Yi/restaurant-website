class Setting < ApplicationRecord
  mount_uploader :intro_image, DishImageUploader
  mount_uploader :menu_image, DishImageUploader
end
