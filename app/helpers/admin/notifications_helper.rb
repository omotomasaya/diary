module Admin::NotificationsHelper
  def display_notification_status(notification)
    if notification.start_datetime > Time.current
      "公開前"
    elsif notification.start_datetime <= Time.current && (notification.end_datetime.blank? || notification.end_datetime > Time.current)
      "公開中"
    else
      "非公開"
    end
  end
end
