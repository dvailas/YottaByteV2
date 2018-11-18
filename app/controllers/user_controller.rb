class UserController < ApplicationController
  def new

  end

  def create
    @user = User.new(:name => params[:user][:name],
                    :email => params[:user][:email],
                    :password => params[:user][:password],
                    :address => params[:user][:address],
                    :city => params[:user][:city],
                    :country => params[:user][:country],
                    :province =>Province.find(params[:user][:province]),
                    :postalcode => params[:user][:postalcode])
    @user.save
    redirect_to root_url
  end

  def show
  end
end
