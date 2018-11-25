class RequestsController < ApplicationController
  def create
    @request = Request.new
    @request.listing_id = params["listing_id"]
    @request.user = current_user
    authorize(@request)
    if @request.save
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.js  # <-- will render `app/views/requests/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js  # <-- idem
      end
    end

  end

  def update
    @request = Request.find(params["id"])
    @request.status = params["value"]
    @request.save!
    @listing = Listing.find(params[:listing_id])

    if params["value"] == "accepted"
      @listing.item.listings.each do |listing|
        listing.is_available = false
        listing.save!
      end
    end
    raise
    authorize(@request)

    redirect_to dashboard_path
  end

  private

  def find_listing
    @listing = List.find(params[:listing_id])
    authorize(@listing)
  end
end
