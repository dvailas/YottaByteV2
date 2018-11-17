class ProductController < ApplicationController

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
    @checkout = Product.find(session[:cart])
    @subtotal = @checkout.sum(&:price)
    @prov = Province.first()
  end

  def remove_item
    id = params[:id].to_i
    session[:cart].delete_at(session[:cart].index(id))
    redirect_to root_url
  end

  def make_order

    redirect_to root_url
  end

end
