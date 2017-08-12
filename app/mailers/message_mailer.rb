class MessageMailer < ApplicationMailer

  def contact_us(message)
    @name = message.name
    @email = message.email
    @body = message.body

    mail to: "morgan@judgecase.com", from: 'info@judgecase.com'
  end

end
