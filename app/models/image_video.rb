class ImageVideo < ApplicationRecord
  belongs_to :user
  has_many :image_videos, dependent: :destroy
end
