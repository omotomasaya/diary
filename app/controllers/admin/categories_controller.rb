class Admin::CategoriesController < Admin::ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.order(:sort_no)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    ApplicationRecord.transaction do
      @category.save!
    end
    redirect_to action: :index
  rescue StandardError => e
    logger.error(e)
    render :new, status: :unprocessable_entity
  end

  def edit; end

  def update
    ApplicationRecord.transaction do
      @category.update!(category_params)
    end
    redirect_to action: :index
  rescue StandardError => e
    logger.error(e)
    render :edit, status: :unprocessable_entity
  end

  private

    def set_category
      @category = Category.find_by_id(params[:id])

      render_404 unless @category
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
