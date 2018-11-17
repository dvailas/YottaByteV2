class UserController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    @user.save
    redirect_to root_url
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :address,:city,:postalcode,:country,:province)
  end
end
