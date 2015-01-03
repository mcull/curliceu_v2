class ChargesController < ApplicationController

def new
end

def create

  customer = Stripe::Customer.create(
    :email => params[:billingEmail],
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => params[:price],
    :description => 'Charge for Curliceu',
    :currency    => 'usd'
  )

  @order = Order.new;
  @order.id = charge[:id]
  @order.order_date = DateTime.now
  @order.amount =charge[:amount]/100
  @order.text = params[:text]
  @order.font = params[:font]
  @order.material = params[:material]
  @order.cardBrand = charge[:card][:brand]
  @order.last4 = charge[:card][:last4]
  @order.billName = params[:billName]
  @order.billAddress1 = params[:billAddress1]
  @order.billAddress2 = params.has_key?(:billAddress2) ? params[:billAddress2]: "none"
  @order.billCity = params[:billCity]
  @order.billState = params[:billState]
  @order.billZip = params[:billZip]
  @order.shippingMethod = params[:billZip]
  @order.shipName = params[:shipName]
  @order.shipAddress1 = params[:shipAddress1]
  @order.shipAddress2 = params.has_key?(:shipAddress2) ? params[:shipAddress2]: "none"
  @order.shipCity = params[:shipCity]
  @order.shipState = params[:shipState]
  @order.shipZip = params[:shipZip]
  @order.customer_email = params[:billEmail]
  @order.customer_sms = params.has_key?(:billSMS) ? params[:billSMS]: "none"

  @order.save

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end
end
