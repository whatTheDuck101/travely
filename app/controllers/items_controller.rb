class ItemsController < ApplicationController
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
