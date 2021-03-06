class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :stops
  has_many :items
  has_many :requests # This a user's sent requests
  has_many :listings, through: :items

  validates :first_name, presence: true
  validates :last_name, presence: true

  def received_requests
    requests = []
    self.listings.each do |listing|
      if !listing.requests.empty?
        listing.requests.each do |request|
          requests << request
        end
      end
    end
    return requests
  end

  def requested_already?(item)
    self.requests.each do |request|
      if request.listing.item == item
        return true
      end
    end
    return false
  end

end
