class User < ApplicationRecord
  enum role: { admin: 0, user: 1 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}
  validates :name, presence:true
  validates :email, uniqueness: true
end