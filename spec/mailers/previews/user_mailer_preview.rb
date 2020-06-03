# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def order_receipt
    @order = Order.find(1)
    condition = "line_items.order_id = #{@order.id}"
    @products = Product.joins(:line_item).where(condition)

    UserMailer.order_receipt(@order, @products)
  end
end
