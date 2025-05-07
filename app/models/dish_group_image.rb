class DishGroupImage < ApplicationRecord
  belongs_to :dish_group
  
  mount_uploader :image, DishImageUploader
  
  acts_as_list scope: :dish_group
  
  validates :image, presence: true

  before_save :update_image_attributes
  
  # 圖片有效性檢查
  def image_valid?
    image.present? && image.file.present? && image.file.exists?
  end
  
  before_create do
    self.position ||= self.class.where(dish_group_id: dish_group_id).size + 1
  end
  
  before_destroy do
    self.remove_from_list
  end

  private

  def update_image_attributes
    return true if image.blank? || image.file.blank?
    
    self.image_size = image.file.size if image.file.size.present?
    
    # 檢查文件類型並更新 image_type
    if image.file.content_type.present? && image.file.content_type.start_with?('image/')
      self.image_type = image.file.content_type.split('/').last
    end
    
    true
  end
end
