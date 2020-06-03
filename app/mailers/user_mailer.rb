class UserMailer < ApplicationMailer

  def order_receipt(order, line_items)
    
    @order = order
    @line_items = line_items
    mail(to: @order.email, subject: "Here is your receipt for order number: #{@order.id}")
  end

end
