class CreateQuizzs < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :smoker
      t.string :talker
      t.string :guest

      t.timestamps
    end
  end
end
