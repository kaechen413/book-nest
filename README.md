# Book Nest

Book Nest is a Rails app for discovering books, creating book offers, and managing bookings in one place. It is designed as a simple marketplace-style platform where users can browse books, request bookings, and where owners can manage the offers and reservations tied to their books.

## What It Does

- Lets users browse a catalog of books
- Lets users create book offers
- Supports booking flows between users and owners
- Includes an owner area to review and manage bookings
- Uses authentication so users can manage their own activity

## Tech Stack

- Ruby on Rails 7.1
- PostgreSQL
- Hotwire with Turbo and Stimulus
- Bootstrap 5
- Devise for authentication
- Cloudinary for image uploads
- Geocoder for location-aware features
- Kaminari for pagination
- pg_search for search

## Getting Started

### Prerequisites

- Ruby `3.3.5`
- Bundler
- PostgreSQL
- Node.js and Yarn or another compatible JavaScript setup for Rails assets

### Setup

1. Clone the repository.
2. Install dependencies with `bundle install`.
3. Create and migrate the database with `rails db:create db:migrate`.
4. Add your local environment variables in `.env` if needed.
5. Start the app with `rails server`.

## Environment Variables

Depending on your local setup, you may need values such as:

- `CLOUDINARY_URL`
- Any geocoding or map service keys you add later

## Main Features

- Book index and detail pages
- Book offers management
- Booking creation and editing
- Owner booking dashboard
- Search and pagination
- Authentication with Devise

## Main Routes

- `/` redirects to the book index
- `/books` shows available books
- `/book_offers` handles offer creation
- `/bookings` manages user bookings
- `/owner/bookings` and `/owner/book_offers` provide owner views

## Project Structure

- `app/controllers` contains the application flow for books, bookings, and owners
- `app/models` contains the business logic for offers, bookings, and users
- `app/views` contains the UI pages and shared components
- `db/migrate` contains the database schema changes

## Future Ideas

- Add favorites or saved books
- Improve search and filtering
- Add ratings and reviews
- Add messaging between users and owners

## License

This project was built for learning and portfolio purposes. Add licensing details here if you plan to publish it publicly.
