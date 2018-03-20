class OrderMailer < ApplicationMailer

  def confirmation_mail_after_order(user, order, amount)
    @user = user
    @order = order
    @amount = amount
    productqty = @order.basketlines.sum(:quantity)
    productqty > 1 ? mot = "céramiques" : mot = "céramique"
    mail(to: @user.email, subject: "Confirmation de commande de #{mot}")
  end

  def mail_francoise_after_order(user, order, amount)
    @user = user
    @order = order
    @amount = amount
    mail(to: "#{ENV['EMAIL']}", subject: 'Nouvelle commande recue')
  end

  def send_tracking_after_order(user)
    @user = user
    mail(to: @user.email, subject: 'Numéro de suivi pour votre colis')
  end

end
