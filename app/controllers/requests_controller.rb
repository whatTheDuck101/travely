class RequestsController < ApplicationController
  def create
    @request = Request.new
    @request.listing_id = params["listing_id"]
    @request.user = current_user
    authorize(@request)
    if @request.save
      redirect_to dashboard_path
    else
      render :new
    end

  end

  def update
    @request = Request.find(params["id"])
    @request.status = params["value"]
    @request.save!
    @listing = Listing.find(params[:listing_id])

    if params["value"] == "accepted"
      @request.listing.is_available = false
    end

    authorize(@request)

    redirect_to dashboard_path
  end

  private

  def find_listing
    @listing = List.find(params[:listing_id])
    authorize(@listing)
  end
end
