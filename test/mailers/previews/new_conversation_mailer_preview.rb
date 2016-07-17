# Preview all emails at http://localhost:3000/rails/mailers/new_conversation_mailer
class NewConversationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/new_conversation_mailer/send
  def send
    NewConversationMailer.send
  end

end
