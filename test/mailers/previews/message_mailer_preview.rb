# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/contact_us
  def contact_us
    message = Message.new name:   'foobar',
                                   email:  'foobar@example.com',
                                   body:   'This is the body'

    MessageMailer.contact_us message
  end

end
