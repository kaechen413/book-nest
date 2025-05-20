class BookOffersController < ApplicationController
  def show
    @book_offer = BookOffer.find(params[:id])
  end
end
