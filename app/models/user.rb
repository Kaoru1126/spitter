class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, uniqueness: true

  has_many :tweets
  has_many :relations

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, CoverUploader


end

