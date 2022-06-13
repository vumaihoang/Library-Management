class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :status, default: "Đang Giao"
      t.datetime :start_date
      t.datetime :end_date
      t.integer :cart_id

      t.timestamps
    end
  end
end
