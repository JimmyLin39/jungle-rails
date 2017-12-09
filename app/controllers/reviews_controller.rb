class ReviewsController < ApplicationController
  before_filter :authorize  
  
  def create
    @review = Review.new(review_params)
    @product = Product.find(params[:product_id])
    @review.product = @product
    @review.user = current_user

    if @review.save
      redirect_to @product, notice: 'review was successfully created.'
    else
      # We didn't test this during class
      # It is based on the blog example you all did on Wednesday
      # What has to change to make it work?
      render @product
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
