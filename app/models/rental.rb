class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  validates :status, presence: true
  validates :message, presence: true
  enum :status, {unbooked: 0, booked: 1, pending: 2, cancelled: 3, accepted: 4, refused: 5}
end
