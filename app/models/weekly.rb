class Weekly < ApplicationRecord
  with_options presence: true do
    validates :task
    validates :labor
    validates :classification
  end
end
