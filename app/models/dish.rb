class Dish < ApplicationRecord
  acts_as_list

  TYPE = %w[entree soup chicken beef pork seafood foo\ young\ egg vegetable tofu recommend fried\ noodle chow\ mein fried\ rice ].map(&:freeze).freeze

  default_scope { order(position: :asc) }
  scope :entree, -> { where(dish_type: "entree")}
  scope :soup, -> { where(dish_type: "soup")}
  scope :chicken, -> { where(dish_type: "chicken")}
  scope :beef, -> { where(dish_type: "beef")}

  before_create do
    self.position ||= self.class.all.size + 1
  end

  before_destroy do
    self.remove_from_list
  end
end
