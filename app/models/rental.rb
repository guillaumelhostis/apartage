class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  validates :status, presence: true
  enum :status, {unbooked: 0, booked: 1, pending: 2, cancel: 3}
end
