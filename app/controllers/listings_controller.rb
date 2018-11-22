class ListingsController < ApplicationController
  before_action :create_stop, only: [:index, :new]
  def index
    @listings = policy_scope(Listing)
    create_stop
  end

  def new
    @item = Item.new
    @listing = Listing.new
    authorize(@listing)
  end

  def create
    @item = Item.new(name: params[:listing][:item][:name], description: params[:listing][:item][:description], photo: params[:listing][:item][:photo])
    @listing = Listing.new(listing_params)
    @item.user = @listing.stop.user 
    @listing.item = @item 
    authorize(@listing)
    if @listing.save
      redirect_to dashboard_path 
    else
      render :new
    end 
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

  def listing_params 
    params.require(:listing).permit(:item_id, :stop_id)
  end
end
