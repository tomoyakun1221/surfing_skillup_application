class ImageVideo < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
  validates :image, presence: true
  validates :video, presence: true
  validates :impression_student, presence: true, length: { maximum: 100 }
  validates :impression_owner, presence: true, length: { maximum: 100 } 
  validates :day, presence: true 
end
