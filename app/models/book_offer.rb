class BookOffer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  belongs_to :book

  validates :availability, presence: true
end
