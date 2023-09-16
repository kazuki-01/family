class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :user_icon
  has_one :card, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :email
  end

end
