# Preview all emails at http://localhost:3000/rails/mailers/suscriptor
class SuscriptorPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/suscriptor/suscription
  def suscription
    Suscriptor.suscription
  end
end
