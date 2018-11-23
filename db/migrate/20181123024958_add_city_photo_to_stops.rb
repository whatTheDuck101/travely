class AddCityPhotoToStops < ActiveRecord::Migration[5.2]
  def change
    add_column :stops, :photo, :string
  end
end
