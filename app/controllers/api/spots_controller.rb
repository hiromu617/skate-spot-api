class Api::SpotsController < ApplicationController
  # protect_from_forgery

  def index
    @spots = Spot.all.order(created_at: "DESC")
    render json: @spots
  end

  def show
    @spot = Spot.find(params[:id])
    render json: @spot
  end
  
  def create
    # binding.pry
    @spot = Spot.new(spot_params)

    # @user = User.find_by(uid: params[:uid])

    # @spot.user_id = @user.id

    if @spot.save
      render json: @spot
    else
      render json: @spot.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @spot = spot.find(params[:id])
    @spot.destroy
  end

  private
  
  def spot_params
    params.require(:spot).permit(:name, :description, :prefectures, :lat, :lng, :user_id)
  end
end
