class UsersController < ApplicationController
  def new
    @user = User.new
    @user.save
    session[:user_id] = @user.id
    TempActivity.create(user_id: @user.id)
    redirect_to password_path
  end
  
  def update
    user = User.find_by_id(params[:id])
    user.update_attributes(params[:user])
    redirect_to thanks_path
  end
end
