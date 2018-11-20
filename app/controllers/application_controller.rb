class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :load_and_increment_visit_count
  before_action :load_cart
  before_action :load_user


  def clear_cart
    session[:cart] = []
  end

  private
  def initialize_session
    session[:visit_count] ||= 0
    session[:cart] ||= []
    session[:user] ||= nil
  end

  def load_and_increment_visit_count
    @visit_count = session[:visit_count] + 1
    session[:visit_count] = @visit_count
  end

  def load_cart
    @numbers = []
    session[:cart].each do |c|
      @numbers << c["id"]
    end
    @cart = Product.find(@numbers)
  end

  def load_user
    if session[:user] != nil
     @user = User.find(session[:user]["id"])
    end
  end
end