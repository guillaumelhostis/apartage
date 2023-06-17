class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :flats, :type, :type_of_flat
  end
end
