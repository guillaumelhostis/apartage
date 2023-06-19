class CreateYourSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :your_spaces do |t|
      t.boolean :tv
      t.boolean :bathroom
      t.boolean :terrasse
      t.boolean :wifi
      t.boolean :toilet
      t.references :flat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
