class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :image_videos, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :surf_spots, dependent: :destroy
  has_many :favorite_image_videos, through: :favorites, source: :favorite

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_TEL_REGEX = /\A\d{10,11}\z/

  validates :tel, presence: true, format: { with: VALID_TEL_REGEX }, length: { maximum: 11 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :birthday, presence: true
  validates :email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # ユーザー名による絞り込み
  scope :get_by_name, ->(name) {
    where("name like ?", "%#{name}%")
  }
end