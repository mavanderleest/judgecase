class MessageMailer < ApplicationMailer

  def contact_us(message)
    @body = message.body

    mail to: "morgan@judgecase.com", from: message.email
  end

end
