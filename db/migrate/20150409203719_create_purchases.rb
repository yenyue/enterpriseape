class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :product, index: true
      t.integer :quantity
      t.references :invoice, index: true

      t.timestamps
    end
  end
end
