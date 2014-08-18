class CreateRedemptions < ActiveRecord::Migration
  def change
    create_table :redemptions do |t|
      t.string :ip_address, null: false
      t.integer :code_id, null: false
      t.timestamps
    end
    add_index :redemptions, [:code_id, :ip_address], unique: true
  end
end
