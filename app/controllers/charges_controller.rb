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

    @order = Order.new(order_params);
    @order.id = charge[:id]
    @order.order_date = DateTime.now
    @order.amount =charge[:amount]/100
    @order.cardBrand = charge[:card][:brand]
    @order.last4 = charge[:card][:last4]

    @order.save

    PrinterMailer.printer(@order).deliver_now


    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end

  private
  def order_params
    params.require(:billName,:billAddress1, :billCity, :billState, :billZip, :shippingMethod, :shipName,:shipAddress1, :shipCity, :shipState, :shipZip, :billEmail).permit(:text, :font, :material, :billAddress2, :shipAddress2, :billSMS)
  end

end
