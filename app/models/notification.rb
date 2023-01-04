class Notification < ApplicationRecord
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::Attributes

  enum status: { open: 0, close: 1 }

  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :start_datetime, presence: true
  validates :end_datetime
  validates :status, inclusion: { in: [true, false] }
  validate_with PeriodDatetimeValidator, start_datetime: :start_datetime, end_datetime: :end_datetime, start_datetime: start_datetime,
                                         end_datetime: end_datetime
end
