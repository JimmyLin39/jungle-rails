class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.comm'
  
  def receipt_email(user, order)
    @order = order
    @user = User.find(user)
    mail(to: @user.email, subject: "Here is your recent order# #{@order.id} receipt")
  end
end
