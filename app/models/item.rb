class Item < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :listings, dependent: :destroy
  has_many :requests, through: :listings

  validates_presence_of :photo

  validates :name, presence: true
  validates :description, presence: true
end
