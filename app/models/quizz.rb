class Quizz < ApplicationRecord
  belongs_to :user
  validates :smoker, :talker, :guest, presence: true
  has_one_attached :file
  # validates :user_id, uniqueness: { scope: :customer_id }
end
