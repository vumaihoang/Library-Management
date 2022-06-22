class LineItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart

  scope :with_status, -> { where(status: false) }

  def total_price
    book.price * quantity
  end
end
