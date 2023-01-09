class Admin::NotificationsController < Admin::ApplicationController
  def index
  end

  def new
    @notification = Notification.new
  end
end
