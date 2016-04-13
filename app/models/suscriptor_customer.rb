class SuscriptorCustomer < Suscriptor
  after_create :send_mail

  def send_mail
    SuscriptorMailer.suscription_customer(self).deliver_now
  end
end
