class Quizz < ApplicationRecord
  belongs_to :user
  validates :smoker, :talker, :guest, presence: true
end
