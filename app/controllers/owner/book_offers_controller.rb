class Owner::BookOffersController < ApplicationController
  def index
    @book_offers = BookOffer.where(user: current_user)
  end
end
