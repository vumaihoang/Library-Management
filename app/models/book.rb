class Book < ApplicationRecord
  belongs_to :user
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :book_publishers, dependent: :destroy
  has_many :publishers, through: :book_publishers
  has_many :line_items, dependent: :destroy

  accepts_nested_attributes_for :authors, :publishers, :author_books, :book_publishers

  validates :title, presence: true, length: { maximum: 100}
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true
  validates :role, presence: true
  enum role: { available: 0, unavailable: 1 }

  before_destroy :check_if_has_line_item

  mount_uploader :image, ImageUploader

  private

  def check_if_has_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'This book has a LineItem')
      return false
    end
  end
end
