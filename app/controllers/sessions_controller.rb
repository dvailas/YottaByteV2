class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user == nil
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    else
      if user.password == params[:session][:password]
        # Log the user in and redirect to the user's show page.
        session[:user] = user
        redirect_to root_url
      else
        # Create an error message.
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end
  end

  def destroy
    session[:user] = nil
    redirect_to root_url
  end
end
