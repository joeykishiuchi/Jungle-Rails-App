class UserMailer < ActionMailer::Base

  def order_receipt(order, products)
    
    @order = order
    @products = products
    mail(to: @order.email, from: 'no-reply@jungle.com', subject: "Here is your receipt for order number: #{@order.id}")
  end

end
