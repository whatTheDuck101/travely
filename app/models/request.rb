class Request < ApplicationRecord
  belongs_to :listing
  belongs_to :user # This a borrower
end
