class Admin::NotificationsController < Admin::ApplicationController
  before_action :set_notification, only: [:edit, :update]

  def index
    @q = Notification.ransack(params[:q])
    @notifications = @q.result.order(start_datetime: :desc, end_datetime: :desc)
  end

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
    render :new, status: :unprocessable_entity
  end

  def edit; end

  def update
    ApplicationRecord.transaction do
      @notification.update!(notification_params)
    end
    redirect_to action: :index
  rescue StandardError => e
    logger.error(e)
    render :edit, status: :unprocessable_entity
  end

  private

    def set_notification
      @notification = Notification.find_by_id(params[:id])

      render_404 unless @notification
    end

    def notification_params
      params.require(:notification).permit(
        :title,
        :content,
        :start_datetime,
        :end_datetime
      )
    end
end
