class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @user = current_user
    @stop = Stop.new
  end

  def dashboard


    @stops = current_user.stops
    @items = current_user.items
    @listings = current_user.listings

  end
end
