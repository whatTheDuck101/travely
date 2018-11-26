class ItemsController < ApplicationController
  def destroy
    @item = Item.find(params["id"])
    authorize(@item)
    @item.destroy
  end
end
