class MessageMailer < ApplicationMailer

  def contact_us(message)
    @name = message.name
    @email = message.email
    @body = message.body

    mail to: 'mavanderleest@gmail.com,morgan@atomicdigital.io',
                 cc: 'mvanderleest@semanticsgroup.com',
                 bcc: 'morgan@judgecase.com',
                 from: 'morgan@judgecase.com'
  end

end
