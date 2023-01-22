class Notification < ApplicationRecord
  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :start_datetime, presence: true
  validates_with PeriodDatetimeValidator, start_datetime: :start_datetime, end_datetime: :end_datetime
end
