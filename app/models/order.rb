class Order < ApplicationRecord
  belongs_to :cart
  validates :name, :address, :email, :presence => true
end
