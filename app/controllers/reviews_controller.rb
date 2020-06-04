class ReviewsController < ApplicationController
  def create
    review = Review.new(
      product_id: params[:product_id],
      user_id: current_user.id,
      description: review_params["description"],
      rating: review_params["rating"]
      )
    review.save
    redirect_to "/products/#{params[:product_id]}"
  end 

  private 
  
  def review_params 
    params.require(:review).permit(
        :description,
        :rating
      )
  end
end
