class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def logged_in? ## returns a boolean whether someone is logged in or not
        !!current_user 
    end

    def current_user # returns the current user
        return nil unless session[:session_token]
        User.find_by(session_token: session[:session_token])
    end

    def ensure_user_logged_in 
        unless logged_in?
            flash[:error] = "Must be logged in for that!"
            redirect_to new_session_url
        end
    end

    def log_in_user!(user)
        a = user.reset_session_token!
        session[:session] = a
    end


end
