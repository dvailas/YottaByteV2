class ProductController < ApplicationController
  def index
    @product_collection = Product.order(:name).page(params[:page]).per(5)
    @product_count = @product_collection.count
  end

  def show
    @product_collection = Product.find(params[:id])
  end
end
