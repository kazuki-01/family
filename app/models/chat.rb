class Chat < ApplicationRecord
  with_options presence: true do
    validates :done_id
    validates :user_id
    validates :message
  end
end
