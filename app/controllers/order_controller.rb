class OrderController < ApplicationController

  def new
    @order = Order.new
  end

  def create

    customer = Stripe::Customer.create(
      :email => params[:order][:billingEmail],
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (params[:order][:amount]).to_i*100,
      :description => 'Charge for Curliceu',
      :currency    => 'usd'
    )



    @order = Order.new(params[:order]);
    @order.id = charge[:id]
    @order.order_date = DateTime.now
    @order.cardBrand = charge[:card][:brand]
    @order.last4 = charge[:card][:last4]

    @order.save

    PrinterMailer.printer(@order).deliver_now

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_path

  end

  private
  def order_params
    #params.require(:billName,:billAddress1, :billCity, :billState, :billZip, :shippingMethod, :shipName,:shipAddress1, :shipCity, :shipState, :shipZip, :billEmail).permit(:text, :font, :material, :billAddress2, :shipAddress2, :billSMS)
  end

end
