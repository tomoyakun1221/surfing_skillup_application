class ImageVideo < ApplicationRecord
  has_many :users, through: :favorites
  has_many :favorites
end
