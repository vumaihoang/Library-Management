class AddOrderIdToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :order_id, :integer
  end
end
