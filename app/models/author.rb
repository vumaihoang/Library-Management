class Author < ApplicationRecord
  has_many :author_books, dependent: :destroy
  has_many :books, through: :author_book

  validates :name, presence: true, length: { maximum: 20 }
  validates :country, presence: true
  validates :age, presence: true
end
