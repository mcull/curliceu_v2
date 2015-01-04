class PrinterMailer < ActionMailer::Base
  default from: 'admin@curlic.eu'
  def printer(order)
    @order = order
    mail(to: 'printing@curlic.eu', subject: 'Order ' + @order.id)
  end
end
