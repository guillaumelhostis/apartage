class AddNewColumnstoQuizzs < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzs, :motivation, :string
    add_column :quizzs, :gender, :string
    add_column :quizzs, :music, :string
    add_column :quizzs, :animal, :string
    add_column :quizzs, :guest_animal, :string
    add_column :quizzs, :junior_smoker, :string
  end
end
