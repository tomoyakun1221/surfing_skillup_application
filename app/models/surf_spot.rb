class SurfSpot < ApplicationRecord
  belongs_to :user

  validates :surf_spot, presence: true
end
