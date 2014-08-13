class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.integer :promotion_id, null: false
      t.string :token, null: false
      t.integer :status, default: 0, null: false
      t.integer :quantity, default: 1, null: false
      t.boolean :unique, default: true, null: false
      t.timestamps
    end

    add_index :codes, :promotion_id
    add_index :codes, :token, unique: true
    add_index :codes, :unique
  end
end
