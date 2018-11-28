class StopsController < ApplicationController
  skip_after_action :verify_authorized, only: [:create]

  def create
    generate_user_stops(stops_params)

    if params[:commit] == "Search"
      redirect_to listings_path
    else
      redirect_to new_item_path
    end
  end


  private

  def generate_user_stops(stops)
    stops.each do |stop_number, stop_details|
      stop_details = stop_details.permit(:city, :start_date, :end_date)
      stop = current_user.stops.build(stop_details)
      # city_photo_url = Unsplash::Photo.search(trip.city, 1, 1)[0].urls.regular
      stop.remote_photo_url = "https://kitt.lewagon.com/placeholder/cities/#{stop.city.downcase}"
      only_city_name = stop.city.split(",")[0]
      stop.city = only_city_name.downcase
      stop.save!
    end
  end

  def stops_params
    params.require(:stops)
  end
end
