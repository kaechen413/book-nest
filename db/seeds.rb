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
Book.destroy_all

url = URI("https://openlibrary.org/search.json?publisher=penguin")
response = URI.open(url).read
data = JSON.parse(response)

data["docs"].each do |item|
  Book.create!(
    user: User.first,
    title: item["title"],
    author: item["author_name"]&.first,
    published_year: item["first_publish_year"],
    availability: true
  )
end

puts "Fetched #{data['docs'].length} books from API"

# put user seeds, faker, down here!
