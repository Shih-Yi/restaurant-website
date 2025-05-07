class DishGroupImage < ApplicationRecord
  belongs_to :dish_group
  
  mount_uploader :image, DishImageUploader
  
  acts_as_list scope: :dish_group
  
  validates :image, presence: true
  
  # 圖片類型選項
  IMAGE_TYPES = {
    'cover'  => '封面圖', 
    'slider' => '輪播圖', 
    'detail' => '詳情圖'
  }
  
  # 圖片尺寸選項
  IMAGE_SIZES = {
    'small'  => '小圖', 
    'medium' => '中圖', 
    'large'  => '大圖'
  }
  
  # 默認值
  after_initialize :set_defaults, if: :new_record?
  
  def set_defaults
    self.image_type ||= 'detail'
    self.image_size ||= 'medium'
  end
  
  # 獲取類型顯示名稱
  def image_type_name
    IMAGE_TYPES[image_type] || '未指定'
  end
  
  # 獲取尺寸顯示名稱
  def image_size_name
    IMAGE_SIZES[image_size] || '未指定'
  end
  
  # 圖片有效性檢查
  def image_valid?
    image.present? && image.file.present? && image.file.exists?
  end
  
  # 自定義錯誤處理
  def handle_error(error_msg)
    Rails.logger.error("DishGroupImage error: #{error_msg}")
    errors.add(:image, error_msg)
    false
  end
  
  before_create do
    self.position ||= self.class.where(dish_group_id: dish_group_id).size + 1
  end
  
  before_destroy do
    self.remove_from_list
  end
  
  before_save do
    # 確保類型和尺寸是有效的
    self.image_type = 'detail' unless IMAGE_TYPES.key?(image_type)
    self.image_size = 'medium' unless IMAGE_SIZES.key?(image_size)
  end
end 