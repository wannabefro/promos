class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :header_color, null: false, default: '#2C3E50'
      t.string :content_color, null: false, default: '#E74C3C'
      t.string :header_text, null: false
      t.string :content_text, null: false
      t.integer :promotion_id, null: false

      t.timestamps
    end
    add_index :cards, :promotion_id
  end
end
