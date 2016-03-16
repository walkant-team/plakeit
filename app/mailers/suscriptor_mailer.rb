class SuscriptorMailer < ApplicationMailer

  def suscription_business(suscriptor)
    @suscriptor = suscriptor
    mail to: @suscriptor.email, subject: 'Bienvenido a Plakeit para Empresas'
  end

  def suscription_customer(suscriptor)
    @suscriptor = suscriptor
    mail to: @suscriptor.email, subject: 'Bienvenido a Plakeit'
  end
end
