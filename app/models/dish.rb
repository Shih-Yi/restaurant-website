class Dish < ApplicationRecord
  acts_as_list

  TYPE = %w[Entree Soup Chicken Beef].map(&:freeze).freeze

  default_scope { order(position: :asc) }
  scope :entree, -> { where(dish_type: "Entree")}
  scope :soup, -> { where(dish_type: "Soup")}
  scope :chicken, -> { where(dish_type: "Chicken")}
  scope :beef, -> { where(dish_type: "Beef")}

  before_create do
    self.position ||= self.class.all.size + 1
  end

  before_destroy do
    self.remove_from_list
  end
end
