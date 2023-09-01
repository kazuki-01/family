class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:login], invite_for: 24.hours
  has_one_attached :user_icon

  with_options presence: true do
    validates :name
    validates :email
  end

end
