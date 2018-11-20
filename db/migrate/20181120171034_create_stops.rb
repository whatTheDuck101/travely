class CreateStops < ActiveRecord::Migration[5.2]
  def change
    create_table :stops do |t|
      t.string :city
      t.date :start_date
      t.date :end_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
