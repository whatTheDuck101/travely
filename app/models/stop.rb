class Stop < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :listings
  has_many :items, through: :listings # may not be needed

  validates :city, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  # validate real city?
  def to_label
    "#{self.city}-#{start_date}-#{end_date}"
  end
end
