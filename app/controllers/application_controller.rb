class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :load_and_increment_visit_count
  before_action :load_cart


  def clear_cart
    session[:cart] = []
  end

  private
  def initialize_session
    session[:visit_count] ||= 0
    session[:cart] ||= []
  end

  def load_and_increment_visit_count
    @visit_count = session[:visit_count] + 1
    session[:visit_count] = @visit_count
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end
end