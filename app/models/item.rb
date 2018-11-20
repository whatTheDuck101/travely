class Item < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :listings
  has_many :requests, through: :listings

  validates :name, presence: true
  validates :description, presence: true
end
