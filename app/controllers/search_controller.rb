class SearchController < ApplicationController
  def sale
    @product_collection = Product.where("onsale <> 'false'")
  end

  def result
    if params[:categories] != nil
      @cat = params[:categories]
      @product_collection = Product.where("name LIKE '%" + params[:keyword] + "%' OR
                                          description LIKE '%" + params[:keyword] + "%' AND
                                          category_id IN (" + @cat.join(",") + ")"  )

    else
      @product_collection = Product.where("name LIKE '%" + params[:keyword] + "%' OR
        description LIKE '%" + params[:keyword] + "%'")
    end
  end

  def recent
    @product_collection = Product.where("updated_at >= ?", Date.today()-7)
  end

  def about
    @page = Page.where("title LIKE 'About'")
  end

  def contact
    @page = Page.where("title LIKE 'Contact'")
  end
end
