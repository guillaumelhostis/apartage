class AddTextFieldToRentals < ActiveRecord::Migration[7.0]
  def change
    add_column :rentals, :message, :text
  end
end
