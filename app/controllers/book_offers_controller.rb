class BookOffersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def show
    @book_offer = BookOffer.find(params[:id])
  end
end
