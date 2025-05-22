class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @book_offers = BookOffer.all
  end
end
