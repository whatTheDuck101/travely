class Listing < ApplicationRecord
  belongs_to :item
  belongs_to :stop
  has_many :requests
end
