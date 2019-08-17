class RentalMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rental_mailer.confirmation.subject
  #
  def confirmation
    @user = User.first
    mail to: 'pmiranda7410@gmail.com', subject: "Rental Confirmation of #{@user.name}"
  end
end
