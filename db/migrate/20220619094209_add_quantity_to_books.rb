class AddQuantityToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :quantity, :integer
  end
end
