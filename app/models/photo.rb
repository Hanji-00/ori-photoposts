class Photo < ApplicationRecord
  validates :title, presence: true, length: {maximum: 20}
  validates :image, presence: true, length: {maximum: 255}
  
  mount_uploader :image, ImageUploader  
  
  belongs_to :user

end
