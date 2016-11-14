class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:success] = log_in_success(@user)
    else
      flash[:danger] = log_in_error
      redirect_to login_path
    end
  end

  def destroy
    name = current_user.full_name
    session[:user_id] = nil
    redirect_to root_path
    flash[:success] = log_out_success
  end
end
