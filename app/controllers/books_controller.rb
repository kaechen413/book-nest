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
    @booked_periods = Booking.where(book_offer: @book_offers).where.not(status: 'rejected').pluck(:starting_date, :ending_date)
  end
end
