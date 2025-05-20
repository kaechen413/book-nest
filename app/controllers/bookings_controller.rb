class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
    @bookings_as_owner = current_user.bookings_as_owner
    raise
  end
end
