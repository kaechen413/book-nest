# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'json'
require 'open-uri'

puts "Cleaning the DB...."
Booking.destroy_all
BookOffer.destroy_all
Book.destroy_all
User.destroy_all

puts "Creating default user..."
user1 = User.create!(user_name: "Ryan", address: "江戸川区", email: "test1@example.com", password: "123456")
user2 = User.create!(user_name: "Nathaniel", address: "埼玉県", email: "test2@example.com", password: "123456")

puts "Fetching books from Open Library..."
url = URI("https://openlibrary.org/search.json?publisher=penguin")
response = URI.open(url).read
data = JSON.parse(response)

created_count = 0

data["docs"].each do |item|
  Book.create!(
    title: item["title"],
    author: item["author_name"]&.first,
    published_year: item["first_publish_year"],
    image_url: "https://covers.openlibrary.org/b/id/#{item["cover_i"]}-L.jpg"
  )
end

books = Book.limit(10)

# Create 10 book offers by User.first
book_offers = books.map.with_index do |book, i|
  BookOffer.create!(
    availability: i.even?, # alternate true/false
    description: "Book offer ##{i + 1} by #{user1.user_name}",
    user: user1,
    book: book
  )
end

# Create 5 bookings with User.last, each for a different book offer
book_offers.first(5).each_with_index do |offer, i|
  Booking.create!(
    starting_date: Date.today + i,
    ending_date: Date.today + i + 7,
    status: :pending,
    user: user2,
    book_offer: offer
  )
end

puts "Fetched #{data['docs'].length} books from API"

# put user seeds, faker, down here!
