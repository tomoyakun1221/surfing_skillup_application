class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    has_many :events, dependent: :destroy
    has_many :image_videos, dependent: :destroy
    has_many :surf_spots, dependent: :destroy
    has_many :favorites, dependent: :destroy

    attr_accessor :remember_token
    before_save { self.email = email.downcase }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_TEL_REGEX = /\A\d{10,11}\z/
    VALID_NAME_CALL_REGEX = /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/

    validates :name, presence: true, length: { maximum: 50 }
    validates :tel, presence: true, format: { with: VALID_NAME_CALL_REGEX }
    validates :tel, presence: true, format: { with: VALID_TEL_REGEX }, length: { maximum: 11 }
    validates :email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
end