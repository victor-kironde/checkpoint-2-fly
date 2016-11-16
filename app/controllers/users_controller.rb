class UsersController < ApplicationController
  before_action :require_login, only: [:bookings]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:success] = sign_up_welcome(@user)
    else
      render "new"
    end
  end

  def bookings
    @bookings = current_user.bookings.order(updated_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                 :password, :password_confirmation)
  end
end
