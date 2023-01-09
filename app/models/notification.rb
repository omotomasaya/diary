class Notification < ApplicationRecord
  enum status: { open: 0, close: 1 }

  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :start_datetime, presence: true
  validates :status, inclusion: { in: [true, false] }
  validates_with PeriodDatetimeValidator, start_datetime: :start_datetime, end_datetime: :end_datetime
end
