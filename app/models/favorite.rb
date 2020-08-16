class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :image_video
  has_many :image_videos, dependent: :destroy
end
