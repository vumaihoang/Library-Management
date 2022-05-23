class Book < ApplicationRecord
  belongs_to :user
  has_many :author_books 
  has_many :authors, through: :author_books
  has_many :book_publishers
  has_many :publishers, through: :book_publishers

  accepts_nested_attributes_for :authors, :publishers, :author_books, :book_publishers

  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 50 }
  validates :price, presence: true
  validates :role, presence: true
  enum role: { available: 0, unavailable: 1 }
end
