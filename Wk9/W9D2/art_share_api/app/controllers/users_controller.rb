class UsersController < ApplicationController
  def index
    if params[:user][:username]
      render json: User.find_by(username: params[:user][:username])
    else
      users = User.all
      render json: users
    end
  end
  
  def show 
    user = User.find(params[:id])
     render json: user
  end

  def create 
    user = User.new(user_params)
    if user.save
      render plain: "created user: #{user.username} with id: #{user.id}", json: user
    else
      render json: user.errors.full_messages, status: 422
    end
    
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  def nest
    render json: params['some_category']['inner_inner_hash']
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end