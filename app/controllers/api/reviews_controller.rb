class Api::ReviewsController < ApplicationController
  # protect_from_forgery
  ActiveModel::Serializer.config.adapter = :json
  
  def create
    # すでにレビューを投稿していないかチェック
    if !Review.find_by(user_id: review_params[:user_id], spot_id: review_params[:spot_id]).nil?
      render json: {errorMessage: "既にレビューを投稿しています"}
      return
    end

    @review = Review.new(review_params)

    if @review.save
      # spotのscoreを更新
      spot = Spot.find(review_params[:spot_id])
      total = spot.score * (spot.reviews.count-1) + review_params[:rating] 
      spot.score = total / spot.reviews.count
      spot.save
      return
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  
  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :spot_id)
  end
end
