class SuscriptorBusiness < Suscriptor

  after_create :send_mail

  validates :phone, presence: true, length: { maximum: 255 }
  validates :fullname, presence: true, length: { maximum: 255 }
  validates :name_business, presence: true, length: { maximum: 255 }

  def send_mail
    SuscriptorMailer.suscription_business(self).deliver_now
  end
end
