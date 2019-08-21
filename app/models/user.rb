class User < ApplicationRecord
  has_secure_password
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, :default_url => "/assets/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :nickname, uniqueness: true
  validates :email, uniqueness: true

  after_create :send_confirmation

  private

  def send_confirmation
    RentalMailer.with(user: self).confirmation.deliver_now!
  end

end
