class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :book_offers, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :bookings_as_owner, through: :book_offers, source: :bookings

  validates :user_name, presence: true
  validates :address, presence: true
  geocoded_by :short_address
  after_validation :geocode, if: :will_save_change_to_address?

  def short_address
    address[/.*(?=丁目)/] ? address[/.*(?=丁目)/] + "丁目" : address
  end
end
