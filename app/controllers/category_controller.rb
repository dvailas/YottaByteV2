class CategoryController < ApplicationController
  def show
    @product_collection = Product.where("category_id = ?", params[:id])
  end
end
