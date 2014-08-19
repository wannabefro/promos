class AddLocationToRedemption < ActiveRecord::Migration
  def change
    add_column :redemptions, :location, :text
  end
end
