class Flat < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_many :your_spaces, dependent: :destroy
  pg_search_scope :search_by_city_and_monthly_price,
  against: [ :city, :monthly_price ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
