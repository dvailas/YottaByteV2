class SearchController < ApplicationController
  def sale
    @product_collection = Product.where("onsale <> 'false'")
  end

  def result
  end

  def recent
    @product_collection = Product.where("update_at >= ?", now()-7)
  end
end
