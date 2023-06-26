class Flat < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :rentals, dependent: :destroy
end
