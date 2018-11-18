class ProductController < ApplicationController
  require 'date'

  def index
    @product_collection = Product.order(:name).page(params[:page]).per(5)
    @product_count = @product_collection.count
  end

  def show
    @product_collection = Product.find(params[:id])
  end

  def add_item
    id = params[:id].to_i
    unless session[:cart].include?(id)
      session[:cart]  << id
    end
    redirect_to root_url
  end

  def checkout
    @subtotal = calculate_total()
    @prov = Province.first()
  end

  def remove_item
    id = params[:id].to_i
    session[:cart].delete_at(session[:cart].index(id))
    redirect_to root_url
  end

  def make_order
    @purchase = Purchase.new(:user => User.first(),
                             :user_id => User.first().id,
                             :status => "Purchased",
                             :subtotal => calculate_total(),
                             :total=> calculate_total() + (calculate_total() * 0.07))
    @cart.each do |c|
      PurchaseProduct.new(:product => c,
                           :product_id => c.id,
                           :purchase => @purchase,
                           :purchase_id => @purchase.id,
                           :quantity => 1,
                           :price => c.price,
                           :total => c.price * 1).save
    end
    redirect_to root_url
  end

  def calculate_total
    @checkout = Product.find(session[:cart])
    return @checkout.sum(&:price)
  end

end
