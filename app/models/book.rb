class Book < ApplicationRecord
  has_many :book_offers
  validates :title, presence: true
  validates :author, presence: true
end
