class Listing < ApplicationRecord
  belongs_to :item
  belongs_to :stop
  has_many :requests

  accepts_nested_attributes_for :item
  def self.intersection_dates(start_date_1, end_date_1, start_date_2, end_date_2)
    return (start_date_1..end_date_1).to_a & (start_date_2..end_date_2).to_a
  end

end
