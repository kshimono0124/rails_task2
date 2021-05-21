class User < ApplicationRecord
  has_many :rooms
  has_many :reservations, dependent: :destroy
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, uniqueness: true
  validates :name,  uniqueness: true, presence: true
  
  # validates :image,        presence: true, if: :current_user?
  # validates :introduction, presence: true, if: :user_signed_in?
end
