class Favorite < ApplicationRecord
  belongs_to :user

  validates :favorite, presence: true
end
