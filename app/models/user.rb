class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :image_videos, dependent: :destroy
  has_many :surf_spots, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attr_accessor :remember_token
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 100 }
  validates :name_call, presence: true, length: { maximum: 100 }
  validates :tel, presence: true, format: { with: VALID_TEL_REGEX }, length: { maximum: 11 }
  validates :email, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :age, presence: true, length: { maximum: 50 }
  validates :age, presence: true, length: { maximum: 50 }
end
