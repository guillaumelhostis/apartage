class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  validates :status, presence: true
end
