class Order < ApplicationRecord
  belongs_to :cart
  has_many :line_items

  validates :name, :address, :email, :presence => true

  def total_price
    prices = []
    self.line_items.each do |line_item|
      prices << line_item.price
    end
    prices.sum
  end
end
