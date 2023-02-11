class AppUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :trackable

  has_many :diaries, dependent: :destroy

  validates :password, presence: true, length: { minimum: 8 }, confirmation: true,
                       format: { with: Constants::VALID_PASSWORD_REGEX,
                                 message: 'は半角英数を両方含む必要があります' }, on: :create
  validates :password, presence: true, allow_blank: true, on: :update
  validates :password, length: { minimum: 8 }, confirmation: true,
                       format: { with: Constants::VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }, if: :exists_password?
  validates :password_confirmation, presence: true, on: :create
  validates :password_confirmation, presence: true, allow_blank: true, if: :exists_password?
  validates :email, presence: true, format: { with: Constants::VALID_EMAIL_REGEX }, uniqueness: true
  validates :nickname, length: { maximum: 20 }

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update!(params, *options)
    clean_up_passwords
    result
  end

  private

    def exists_password?
      password.present? && password_confirmation.present?
    end
end
