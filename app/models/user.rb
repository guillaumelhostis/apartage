class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :flats
  has_one_attached :image

  has_many :rentals
  has_many :receivedrentals, through: :flats, source: :rentals

  has_many :quizzs

end
