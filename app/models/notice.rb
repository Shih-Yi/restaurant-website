class Notice < ApplicationRecord

  # public instance methods ...................................................

  def active
    Time.current > start_at && Time.current < end_at
  end
end
