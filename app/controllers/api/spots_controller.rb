class Api::SpotsController < ApplicationController
  # protect_from_forgery
  ActiveModel::Serializer.config.adapter = :json

  def index
    spots = Spot.all.order(created_at: "DESC").page(params[:page]).per(3)

    if spots.nil?
      render nil
      return
    end
    puts spots.total_pages
    render json: spots, meta: { totalPages: spots.total_pages }
  end

  def show
    @spot = Spot.find(params[:id])
    render json: @spot, include: ['user', 'reviews' ,'reviews.user']
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

  def update
    # binding.pry
    @spot = Spot.find(params[:id])
    if !@spot 
      return 
    end
    if @spot.update(spot_params)
      render json: @spot
    else
      render json: @spot.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
  end

  private
  
  def spot_params
    params.require(:spot).permit(:name, :description, :prefectures, :lat, :lng, :user_id, :is_anonymous)
  end
end
