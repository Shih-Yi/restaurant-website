class Dish < ApplicationRecord
  acts_as_list

  before_create do
    self.position ||= self.class.all.size + 1
  end

  before_destroy do
    self.remove_from_list
  end
end
