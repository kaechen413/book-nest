class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
    @pendings = current_user.bookings.where(status: "pending")
    @currents = current_user.bookings.where(status: "accepted")
    @rejected = current_user.bookings.where(status: "rejected")
  end

  def new
    @book_offer = BookOffer.find(params[:book_offer_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @book_offer = BookOffer.find(params[:book_offer_id])
    dates = params[:booking][:starting_date].split(' to ')

    @booking.starting_date = dates[0].to_date
    @booking.ending_date = dates[1].to_date
    @booking.user = current_user
    @booking.book_offer = @book_offer
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date)
  end
end
