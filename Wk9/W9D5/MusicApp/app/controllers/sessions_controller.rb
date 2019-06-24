class SessionsController < ApplicationController 
    def new 
        render :new
    end 

    def create # will be used to log users in 
        user = User.find_by_credentials(params[:email],
            params[:password])

            if user # if user exists 
                log_in_user!(user)
                flash[:success] = "Logged in successfully!, selcome back!"
                #redirect_to possibly homepage or somewehre where
            else
                flash[:error] = "Wrong email/password combo"
                render :new, status: 401

            end
    end 

    def destroy # to log out, signout button will go on the layout
        current_userr.reset_session_token!
        session[:session_token] = nil 
        flash[:success] = "Logged out!"
        redirec_to new_session_url
    end

 
end 