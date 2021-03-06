class ApplicationController < ActionController::Base

helper_method :current_user


    def logged_out?
      !session[:user_id]
    end

    def require_login
      if !session[:user_id]
        flash[:error] = "You must be logged in to do that"
        redirect_to login_path
      end
    end



    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
      #saves you a db call if you already have a value in @current_user
    end







end
