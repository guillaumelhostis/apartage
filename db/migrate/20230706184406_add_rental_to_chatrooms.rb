class AddRentalToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :rental, foreign_key: true, null: true
  end
end
