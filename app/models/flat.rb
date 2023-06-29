class Flat < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many_attached :photos
  has_many :rentals, dependent: :destroy
  has_many :your_spaces, dependent: :destroy
  pg_search_scope :search_by_city,
  against: [ :city ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
  geocoded_by :full_street_address
  after_validation :geocode, if: :will_save_change_to_address?

  def full_street_address
    [address, city].compact.join(', ')
  end
end
