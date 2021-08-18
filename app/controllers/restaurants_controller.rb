class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

   # GET /restaurants
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: 'Restaurant was successfully created.'
    else
      render :new # for errors of validation. With render :new, unlike redirect_to, you can show a new page again without reset of form values. It's pretty useful in the aspect of UX.
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
