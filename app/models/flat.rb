class Flat < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
end
