class Done < ApplicationRecord
  with_options presence: true do
    validates :task
    validates :user_id
    validates :labor
    validates :classification
  end
end
