class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.references :item, foreign_key: true
      t.references :stop, foreign_key: true
      t.boolean :is_available, default: true

      t.timestamps
    end
  end
end
