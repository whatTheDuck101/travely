class ListingsController < ApplicationController
  def index
    @listings = policy_scope(Listing)
  end

  def new
    @item = Item.new
    @listing = Listing.new
  end

  def create

  end
end
