class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :image
      t.integer :role
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
