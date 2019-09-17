class ApplicationController < ActionController::Base


    def logged_out?
      !session[:user_id]
    end




end
