class Admin::CategoriesController < Admin::ApplicationController
  before_action :set_categories

  before_action :set_category, only: [:update, :destroy]

  before_action :set_new_category, only: [:index, :update, :destroy]

  def index; end

  def create
    @new_category = Category.new(category_params)

    ApplicationRecord.transaction do
      @category.save!
    end

    redirect_to action: :index
  rescue StandardError => e
    logger.error(e)

    render :index, status: :unprocessable_entity
  end

  def update
    ApplicationRecord.transaction do
      @category.update!(category_params)
    end

    redirect_to action: :index
  rescue StandardError => e
    logger.error(e)

    render :index, status: :unprocessable_entity
  end

  def destroy
    ApplicationRecord.transaction do
      @category.destroy!
    end

    redirect_to action: :index
  rescue StandardError
    StandardError => e

    logger.error(e)

    render :index, status: :unprocessable_entity
  end

  private

    def set_categories
      @categories = Category.order(:sort_no)
    end

    def set_category
      @category = Category.find_by_id(params[:id])

      render_404 unless @category
    end

    def set_new_category
      @new_category = Category.new
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
