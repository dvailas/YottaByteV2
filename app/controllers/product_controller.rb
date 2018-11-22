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
    ids =[]
    session[:cart].each do |c|
      ids << c["id"]
    end
    unless ids.include?(id)
      session[:cart]  << {:id => id, :qty => params[:qty]}
    else
      session[:cart].each do |c|
        if c["id"] == id
           c["qty"] = params[:qty]
        end
      end
    end
    redirect_to root_url
  end

  def checkout
    if session[:user] == nil
      redirect_to '/login'
    end
    @i = 0
    @subtotal = calculate_total()
    @prov = Province.first()
  end

  def remove_item
    id = params[:id].to_i
    i = 0
    session[:cart].each do |c|
      if c["id"] == id
        break
      end
      i = i +1
    end
    puts i
    session[:cart].delete_at(i)
    redirect_to root_url
  end

  def cart
    @i = 0
  end

  def make_order
    i = 0
    @prov = Province.find(session[:user]["province_id"])
    @purchase = Purchase.new(:user => @user,
                             :user_id => @user.id,
                             :status => "Purchased",
                             :subtotal => calculate_total().round(2),
                             :total=> (calculate_total() + (calculate_total() * @prov.GST) + (calculate_total() * @prov.HST) + (calculate_total() * @prov.PST)).round(2))
    @cart.each do |c|
      PurchaseProduct.new(:product => c,
                           :product_id => c.id,
                           :purchase => @purchase,
                           :purchase_id => @purchase.id,
                           :quantity => session[:cart][i]["qty"],
                           :price => c.price,
                           :total => c.price * 1).save
          i = i +1
    end
    redirect_to root_url
  end

  def calculate_total
    sum = 0
    i = 0
    @cart.each do |c|
      sum = sum + c.price * session[:cart][i]["qty"].to_i
      i = i +1
    end
    return sum.round(2)
  end

end
