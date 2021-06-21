class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users 
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: @user, include: ['spots', 'reviews' ,'reviews.user','spots.user','spots.reviews']
    else
      render json: nil
    end
  end

  def create
      # binding.pry
      #すでにユーザーがいればそのユーザーを返す
      if User.find_by(uid: user_params[:uid])
        render json: User.find_by(uid: user_params[:uid])
        return
      end

      @newUser = User.new(user_params)
      if @newUser.save
        render json: @newUser
      else
        render json: @userUser.errors, status: :unprocessable_entity
      end
    # end
    
  end

  def update
    # binding.pry
    @user = User.find_by(uid: params[:uid])
    if !@user 
      return 
    end
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :uid)
  end
end
