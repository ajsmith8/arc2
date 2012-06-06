class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :signed_in?
  
  def signed_in?
    !!current_user
  end
  
  private
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "You must be signed in to access this."
      end
    end
  
    def redirect_back_or
      redirect_to(session[:return_to] || root_url)
      clear_stored_location
    end
  
    def store_location
      session[:return_to] = request.fullpath
    end
  
    def clear_stored_location
      session[:return_to] = nil
    end
end
