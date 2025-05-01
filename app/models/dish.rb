class Dish < ApplicationRecord
  acts_as_list

  TYPE = { "entree" => "頭盤", "soup" => "湯類", "chicken" => "雞類", "beef" => "牛肉類",
           "pork" => "豬肉類", "seafood" => "海鮮類", "foo young egg" => "芙蓉蛋類",
           "vegetable" => "蔬菜類", "tofu" => "豆腐類", "BBQ" => "BBQ燒味",
           "fried noodle" => "乾炒麵", "chow mein" => "濕炒麵", "fried rice" => "炒飯",
           "cold dishes" => "冷盤", "set menu" => "套餐" }.freeze

  belongs_to :dish_group
           
  default_scope { order("dishes.position asc") }
  scope :entree, -> { joins(:dish_group).where(dish_groups: { group_type: "entree" }).order("dishes.position asc") }
  scope :soup, -> { joins(:dish_group).where(dish_groups: { group_type: "soup" }).order("dishes.position asc") }
  scope :chicken, -> { joins(:dish_group).where(dish_groups: { group_type: "chicken" }).order("dishes.position asc") }
  scope :beef, -> { joins(:dish_group).where(dish_groups: { group_type: "beef" }).order("dishes.position asc") }

  before_create do
    self.position ||= self.class.all.size + 1
  end

  before_destroy do
    self.remove_from_list
  end
end
