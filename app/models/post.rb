class Post < ApplicationRecord
  validates :title,       presence: true, length: { minimum: 5 }
  validates :body,        presence: true
  VALID_SLUG_REGEX = /\A[a-z0-9]+(?:(-|_)[a-z0-9]+)*\z/
  validates :slug,        presence: true,
                          format: { with: VALID_SLUG_REGEX },
                          uniqueness: { case_sensitive: false }
  validates :author_name, presence: true


  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
