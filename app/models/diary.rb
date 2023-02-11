class Diary < ApplicationRecord
  belongs_to :app_user

  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :calendar_date, presence: true
end
