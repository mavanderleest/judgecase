class Partner < ApplicationRecord
  validates :name,      presence: true
  validates :business,  presence: true
  VALID_WEBSITE_REGEX = /(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9]\.[^\s]{2,})/
  validates :website, presence: true, length: { maximum: 255 },
                    format: { with: VALID_WEBSITE_REGEX },
                    uniqueness: { case_sensitive: false }
end
