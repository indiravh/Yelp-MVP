class ReviewsController < ApplicationController
   def new
    # we need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
     if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new # for errors of validation. With render :new, unlike redirect_to, you can show a new page again without reset of form values. It's pretty useful in the aspect of UX.
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
