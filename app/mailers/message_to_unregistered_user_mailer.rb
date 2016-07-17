class MessageToUnregisteredUserMailer < ApplicationMailer
  default from: "mrsmalldog001@gmail.com"

  def signup_email(sender, recipient_email)
    @sender = sender
    mail(to: recipient_email, subject: 'Deadpool message from #{@sender.name}. Join now!')
  end
end
