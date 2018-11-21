class RequestsController < ApplicationController
  def create
    @request = Request.new
    @request.listing = @listing
    @booking.user = current_user
    authorize(request)
  end

  def update
    request = Request.find(params[:id])
    authorize(request)
  end

  private

  def find_listing
    @listing = List.find(params[:listing_id])
    authorize(@listing)
  end
end
