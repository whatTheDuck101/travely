class ListingsController < ApplicationController
  def index
    raise
    @listings = policy_scope(Listing)
    create_stop
  end

  def new

    @item = Item.new
    @listing = Listing.new
    authorize(@listing)
  end

  def create

  end

  private

  def create_stop
    @city = params[:city]
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @stop = Stop.new(city: @city, start_date: @start_date, end_date: @end_date)
    @stop.user = current_user
    @stop.save
  end
end
