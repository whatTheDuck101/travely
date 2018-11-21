class StopsController < ApplicationController
  skip_after_action :verify_authorized, only: [:create]

  def create
    generate_user_stops(stops_params)
    if params[:commit] == "Search"
      redirect_to listings_path
    else
      redirect_to new_listing_path
    end
  end


  private

  def generate_user_stops(stops)
    stops.each do |stop_number, stop_details|
      stop_details = stop_details.permit(:city, :start_date, :end_date)
      trip = current_user.stops.build(stop_details)
      trip.save!
    end
  end

  def stops_params
    params.require(:stops)
  end
end
