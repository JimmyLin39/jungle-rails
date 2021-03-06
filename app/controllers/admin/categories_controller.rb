class Admin::CategoriesController < ApplicationController
  before_filter :authorize
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']
  
  def index
    @categories = Category.order(name: :asc).all
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.create(category_param)
    
    if @category.save
      redirect_to [:admin, :categories], notice: 'Product created!'
    else
      render :new
    end
  end

  def category_param
    params.require(:category).permit(
      :name
    )
  end
end
