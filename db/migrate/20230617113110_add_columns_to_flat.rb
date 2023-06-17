class AddColumnsToFlat < ActiveRecord::Migration[7.0]
  def change
    add_reference :flats, :user, null: false, foreign_key: true
    add_column :flats, :capacity, :integer
    add_column :flats, :address, :string
    add_column :flats, :city, :string
    add_column :flats, :monthly_price, :integer
    add_column :flats, :garden, :boolean
    add_column :flats, :longitude, :float
    add_column :flats, :latitude, :float
    add_column :flats, :type, :string
  end
end
