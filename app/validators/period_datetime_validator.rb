class PeriodDatetimeValidator < ActiveModel::Validator
  def validate(record)
    start_datetime = record.send(options[:start_datetime])
    end_datetime = record.send(options[:end_datetime])
    return unless start_datetime.present? && end_datetime.present? && start_datetime > end_datetime

    record.errors.add(options[:end_datetime], "はstart_datetimeより後に設定してください")
  end
end
