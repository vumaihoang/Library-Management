class AddOrderIdToLineItems < ActiveRecord::Migration[6.1]
  def change
    add_column :line_items, :order_id, :integer
  end
end
