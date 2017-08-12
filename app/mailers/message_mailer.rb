class MessageMailer < ApplicationMailer

  def contact_us(message)
    @name = message.name
    @email = message.email
    @body = message.body

    mail to: 'amanda@judgecase.com',
                 cc: 'kcase@judgecase.com',
                 bcc: 'morgan@judgecase.com',
                 from: 'morgan@judgecase.com'
  end

end
