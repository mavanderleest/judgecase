require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test 'responds to name, email, and body' do
    msg = Message.new

    assert msg.respond_to?(:name), 'does not respond to :name'
    assert msg.respond_to?(:email), 'does not respond to :email'
    assert msg.respond_to?(:body), 'does not respond to :body'
  end

  test 'should be valid when all attributes are set' do
    attrs = {
        name:   'morgan',
        email:  'morgan@judgecase.com',
        body:   'sweet test bro'
    }

    msg = Message.new attrs
    assert msg.valid?, 'should be valid'
  end

  test 'name, email, and body are required to exist by the almighty creator' do
    msg = Message.new

    refute msg.valid?, 'Blank Message should be invalid'

    assert_match /blank/, msg.errors[:name].to_s
    assert_match /blank/, msg.errors[:email].to_s
    assert_match /blank/, msg.errors[:body].to_s
  end

end
