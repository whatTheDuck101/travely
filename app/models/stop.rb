class Stop < ApplicationRecord
  belongs_to :user
  has_many :listings
  has_many :items, through: :listings # may not be needed

  validates :city, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  # validate real city?
end
