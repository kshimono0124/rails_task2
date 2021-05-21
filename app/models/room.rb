class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  mount_uploader :image, ImageUploader
  
  validates :name,    presence: true
  validates :content, presence: true
  validates :price,   presence: true
  validates :address, presence: true
  validates :image,   presence: true
  
end
