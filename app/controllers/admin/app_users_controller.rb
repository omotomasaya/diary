class Admin::AppUsersController < ApplicationController
  # TODO: update動作未確認
  # TODO: 日記コンテンツ作成時、修正
  before_action :set_app_user, only: [:show, :edit, :update, :destroy]

  def index
    @q = AppUser.ransack(params[:q])
    @app_users = @q.result.order(created_at: :desc)
  end

  def new
    @app_user = AppUser.new
  end

  def create
    @app_user = AppUser.new(app_user_params)

    ApplicationRecord.transaction do
      @app_user.save!
    end
    redirect_to action: :index
  rescue StandardError => e
    logger.error(e)
    render :new, status: :unprocessable_entity
  end

  def show; end

  def edit; end

  def update
    if app_user_params[:password].blank? && app_user_params[:password_confirmation].blank?
      updated_params = app_user_params
      updated_params.delete(:password)
      updated_params.delete(:password_confirmation)
    else
      updated_params = app_user_params
    end

    ApplicationRecord.transaction do
      if updated_params[:password].blank? && updated_params[:password_confirmation].blank?
        @app_user.update_without_current_password(updated_params)
      else
        @app_user.update!(updated_params)
      end
    end
    redirect_to action: :index
  rescue StandardError => e
    logger.error(e)
    render :edit, status: :unprocessable_entity
  end

  def destroy
    ApplicationRecord.transaction do
      @app_user.destroy!
    end
    redirect_to action: :index
  rescue StandardError => e
    logger.error(e)
    render :show, status: :unprocessable_entity
  end

  private

    def set_app_user
      @app_user = AppUser.find_by_id(params[:id])

      render_404 unless @app_user
    end

    def app_user_params
      params.require(:app_user).permit(
        :nickname,
        :email,
        :password,
        :password_confirmation
      )
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
