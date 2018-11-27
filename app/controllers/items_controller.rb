class ItemsController < ApplicationController
  def new
    @item = Item.new
    @stops = Stop.where(user: current_user)
    @listing = Listing.new
    authorize(@listing)
  end

  def create
    @item = Item.new(name: params[:item][:name], description: params[:item][:description], photo: params[:item][:photo])
    @item.user = current_user

    if params[:city].present? && @item.save
        array_of_stop_ids = params[:city].keys
        array_of_stop_ids.each do |stop_id|
          @listing = Listing.new
          @listing.stop_id = stop_id
          @listing.item = @item
          @listing.save
        end
      redirect_to dashboard_path
    else
      @stops = Stop.where(user: current_user)
      render :new
    end

    authorize(@item)
  end


  def destroy
    @item = Item.find(params["id"])
    @item_id = @item.id
    authorize(@item)

    if @item.destroy

      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.js  # <-- will render `app/views/items/destroy.js.erb`
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js  # <-- idem
      end
    end
  end

end
