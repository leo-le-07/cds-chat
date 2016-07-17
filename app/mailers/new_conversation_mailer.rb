class NewConversationMailer < ApplicationMailer
  default from: "mrsmalldog001@gmail.com"

  def send()

    byebug
    # @sender = sender
    mail(to: "coder.leo.le@gmail.com", subject: "Dona sent a message to you")
  end
end
