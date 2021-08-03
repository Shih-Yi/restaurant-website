class Dish < ApplicationRecord
  before_create do
    self.position ||= self.class.all.size + 1
  end
end
