class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def new
    @item = Item.new
    @listing = Listing.new
  end 

  def create
    
  end 
end
