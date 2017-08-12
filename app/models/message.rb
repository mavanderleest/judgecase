class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :body
  validates :name, :email, :body,
            length: { minimum:1,
                      message: "is missing"
            }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX, message: "must be valid" }
end
