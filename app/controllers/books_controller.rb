class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:query].present?
      @books = Book.search_by_title_and_author(params[:query])
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_offers = @book.book_offers
    @booking = Booking.new
    users = @book_offers.map(&:user).select(&:geocoded?)
    @markers = users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {
          user: user,
          distance: user.distance_to([current_user.latitude, current_user.longitude])
          })
      }

    end

    @location = {
      lat: current_user.latitude,
      lng: current_user.longitude
    }


  end
end
