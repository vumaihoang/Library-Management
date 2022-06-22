class User < ApplicationRecord
  after_save :create_cart
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true , length: { minimum: 5 }
  validates :phone, presence: true, numericality: true

  has_many :books, dependent: :destroy
  has_one :cart
  enum role: { user:0, admin:1 }

  private

  def create_cart
    cart = Cart.create(user_id: self.id)
    cart
  end
end
