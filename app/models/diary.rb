class Diary < ApplicationRecord
  belongs_to :app_user
  has_many :categories, through: :diary_categories
  has_many :diary_categories

  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :calendar_date, presence: true
end
