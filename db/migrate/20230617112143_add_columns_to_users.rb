class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birth_day, :integer
    add_column :users, :gender, :string
    add_column :users, :role, :string
    add_column :users, :admin, :boolean
    add_column :users, :study_level, :string
    add_column :users, :study_type, :string
  end
end
