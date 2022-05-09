class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { minimum: 6 }
  validates :phone, length: { is: 10 }

  enum role:  { user:0, admin:1 }
end
