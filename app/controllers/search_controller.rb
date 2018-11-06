class SearchController < ApplicationController
  def sale
    @product_collection = Product.where("onsale <> 'false'")
  end

  def result
  end

  def recent
    @product_collection = Product.where("updated_at >= ?", Date.today()-7)
  end
end
