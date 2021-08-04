class Dish < ApplicationRecord
  acts_as_list

  TYPE = %w[Entree Soup Chicken Beef].map(&:freeze).freeze

  scope :entree, -> { where(dish_type: "Entree")}
  scope :soup, -> { where(dish_type: "Soup")}

  before_create do
    self.position ||= self.class.all.size + 1
  end

  before_destroy do
    self.remove_from_list
  end
end
