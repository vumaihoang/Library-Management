class Publisher < ApplicationRecord
  has_many :book_publishers
  has_many :books, through: :book_publisher

  validates :name, presence: true, length: {maximum: 30 }
  validates :address, presence: true, length: {maximum: 30}
end
