class Addmessagetopromotion < ActiveRecord::Migration
  def change
    add_column :promotions, :message, :text
  end
end
