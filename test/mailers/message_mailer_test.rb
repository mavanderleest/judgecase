require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase

  test "contact_us" do
    message = Message.new name:  'morgan',
                                   email: 'morgan@judgecase.com',
                                   body:  'hello, how are you?'

    email = MessageMailer.contact_us(message)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal 'JudgeCase.com contact form submission', email.subject
    assert_equal ['morgan@judgecase.com'],                  email.to
    assert_equal ['morgan@judgecase.com'],                email.from
    assert_match /hello, how are you?/,               email.body.encoded
  end

end
