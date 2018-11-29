class ChargesController < ApplicationController
  def new
    @amount = session[:purchase]["total"].to_d
    @description = "Purchase at YottaByte"
  end

  def create
    # Amount in cents
  @amount = (session[:purchase]["total"].to_i * 100).round()

  @customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  @charge = Stripe::Charge.create(
    :customer    => @customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'cad'
  )

  if @charge.paid && @charge.amount == @amount
    @purchase = Purchase.find(session[:purchase]["id"])
    @purchase.status = "Paid"
    @purchase.save()
    session[:purchase] = nil
    redirect_to root_url
  end

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end
end
