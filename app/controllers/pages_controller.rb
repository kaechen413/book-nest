class PagesController < ApplicationController
  def home
    @book_offers = BookOffer.all
  end
end
