class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  validates :status, presence: true
  validates :message, presence: true
  has_one :chatroom
  enum :status, {unbooked: 0, booked: 1, pending: 2, cancelled: 3, accepted: 4, refused: 5}

  after_commit :create_chatroom, on: :create

  private

  def create_chatroom
    Chatroom.create(rental_id: id, name: "Faisons connaissance")
  end
end
