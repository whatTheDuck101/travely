class ListingsController < ApplicationController
  # def index
  #   @listings = policy_scope(Listing)
  #   @user_stops = current_user.stops
  #   user_cities = @user_stops.map { |stop| stop.city}
  #   sql_query = " \
  #       stops.city ILIKE :query \
  #       "
  #   results = Item.joins(:stop).where(sql_query, query: "montreal")
  #   raise
  # end

  def index
    @items_filtered = []
    @user_stops = current_user.stops
    @user_stops.each do |stop|
      items = policy_scope(Item)
      items = Item.joins(listings: :stop).where(stops: { city: stop.city }).where("start_date < ?", stop.end_date).where("end_date > ?", stop.start_date)

      @items_filtered << { items: items, city: stop.city } if items.any?
    end
  end

  def new
    raise
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






































