class Admin::NotificationsController < Admin::ApplicationController
  def index; end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)

    ApplicationRecord.transaction do
      @notification.save!
    end
    redirect_to action: :index
  rescue StandardError => e
    logger.error(e)
    render :new
  end

  private

    def notification_params
      params.require(:notification).permit(
        :title,
        :content,
        :start_datetime,
        :end_datetime,
        :status
      )
    end
end
