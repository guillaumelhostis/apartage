class Flat < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_many :your_spaces, dependent: :destroy
end
