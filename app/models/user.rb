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
end
