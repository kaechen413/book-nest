class Book < ApplicationRecord
  has_many :book_offers
  validates :title, presence: true
  validates :author, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_author,
    against: [ :title, :author ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
