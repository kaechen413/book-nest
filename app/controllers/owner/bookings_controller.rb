class Owner::BookingsController < ApplicationController
  def index
    @status = params[:status] || "pending"

    @bookings_as_owner = Booking.joins(:book_offer).where(book_offers: { user: current_user })

    case @status
    when "pending"
      @bookings_as_owner = @bookings_as_owner.where(status: "pending")
    when "accepted"
      @bookings_as_owner = @bookings_as_owner.where(status: "accepted").where("ending_date >= ?", Date.today)
    when "past"
      @bookings_as_owner = @bookings_as_owner.where("ending_date < ?", Date.today)
    end
  end

  def update
    @booking = Booking.find(params[:id])

    if params[:status].present? && %w[accepted rejected].include?(params[:status])
      @booking.update(status: params[:status])
      flash[:notice] = "Booking has been #{params[:status]}."
    else
      flash[:alert] = "Invalid action."
    end

    redirect_to owner_bookings_path(status: "pending")
  end
end
