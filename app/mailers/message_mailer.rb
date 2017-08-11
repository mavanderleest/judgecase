class MessageMailer < ApplicationMailer

  def contact_us(message)
    @body = message.body

    mail to: "info@judgecase.com", from: message.email
  end

end
