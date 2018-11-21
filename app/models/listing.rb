class Listing < ApplicationRecord
  belongs_to :item
  belongs_to :stop
  has_many :requests

  def self.intersection_dates(traveller_start_date, traveller_end_date, item_start_date, item_end_date)
    return (traveller_start_date..traveller_end_date).to_a & (item_start_date..item_end_date).to_a
  end
end
