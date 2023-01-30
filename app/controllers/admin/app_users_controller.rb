class Admin::AppUsersController < ApplicationController
  before_action :set_app_user, only: [:show, :edit, :update, :destroy]

  def index
    @q = AppUser.ransack(params[:q])
    @app_users = @q.result.order(create_at: :desc)
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

  # TODO: 日記コンテンツ作成時、修正
  def show; end

  def edit; end

  def update
    ApplicationRecord.transaction do
      @app_user.update!(app_user_params)
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
end
