class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true, format: { with: Constants::VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true, allow_blank: true
  validates :password_confirmation, presence: true, allow_blank: true
end
