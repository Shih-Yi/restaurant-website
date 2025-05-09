class DishGroup < ApplicationRecord
  acts_as_list
  
  has_many :dishes, dependent: :restrict_with_error
  has_many :dish_group_images, -> { order(position: :asc) }, dependent: :destroy
  
  validates :name, presence: true
  validate :maximum_six_images

  default_scope { order("position asc") }
  
  # 允許嵌套表單 - 修改 reject_if 邏輯
  accepts_nested_attributes_for :dish_group_images, 
                               allow_destroy: true, 
                               reject_if: proc { |attributes| 
                                 # 如果標記為刪除，則接受參數進行處理
                                 return false if attributes['_destroy'] == '1'
                                 # 如果既沒有 ID 又沒有上傳新圖片，則拒絕
                                 attributes['image'].blank? && attributes['id'].blank?
                               }
  
  # 自定義驗證方法 - 確保至少有一張圖片
  def must_have_at_least_one_image
    # 只檢查新記錄，並且只檢查已填寫且未標記為刪除的項目
    valid_images = dish_group_images.select do |image|
      image.image.present? && !image.marked_for_destruction?
    end
    
    if valid_images.empty?
      errors.add(:base, "至少需要上傳一張圖片")
    end
  end

  # 驗證最多六張圖片
  def maximum_six_images
    valid_images = dish_group_images.select do |image|
      image.image.present? && !image.marked_for_destruction?
    end
    
    if valid_images.size > 6
      errors.add(:base, "最多只能上傳六張圖片")
    end
  end
  
  # 獲取指定索引的圖片及其標題
  def image_with_title(index)
    image = dish_group_images.order(position: :asc)[index]
    return nil unless image.present?
    
    {
      image: image.image,
      title: image.title || name
    }
  end
  
  # 獲取所有圖片及其標題
  def all_images_with_titles
    dish_group_images.order(position: :asc).map do |image|
      {
        image: image.image,
        title: image.title || name
      }
    end
  end
  
  # 兼容性方法，返回所有圖片
  def images
    dish_group_images.order(position: :asc).map(&:image)
  end
  
  before_create do
    self.position ||= self.class.all.size + 1
  end
  
  before_destroy do
    self.remove_from_list
  end
end 