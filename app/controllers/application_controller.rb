class ApplicationController < ActionController::Base


    def logged_out?
      !session[:user_id]
    end

    def require_login
      flash[:error] = "You must be logged in to do that"
      redirect_to login_path if !session[:user_id]
    end


    def current_user
      @current_user ||= User.find(session[:user_id])
      #saves you a db call if you already have a value in @current_user
    end




end
