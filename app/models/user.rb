class User < ApplicationRecord
  has_secure_password

  validates :username,
            presence: true

  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }

  def to_s
    "#{username}"
  end
end
