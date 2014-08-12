class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :name, null: false
      t.integer :status, default: 0, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    
    add_index :promotions, :user_id
  end
end
