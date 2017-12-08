class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.comm'
  
  def receipt_email(order)
    @order = order
    mail(to: 'a@example.com', subject: "Here is your recent order# #{@order.id} receipt")
  end
end
