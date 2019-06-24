class UsersController < ApplicationController 

    #new-> bands
 def new 
    @user = User.new
    render :new
 end 

 def create ## will be used to create accounts
    @user = User.new(user_params)
     if @user.save
        session[:current_user_id] = @user.id 
        flash[:success] = "Welcome to Music App!"
        # redirect
     end

 end 

private 
 def user_params
    params.require(:user).permite(:email, :password)
 end
end 