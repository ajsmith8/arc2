class SessionsController < ApplicationController
  def create
    
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to ts_path
  end
end
