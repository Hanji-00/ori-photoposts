class Comment < ApplicationRecord
  validates :content, presence: true, length: {maximum: 20}
  validates :image, presence: true, length: {maximum: 255}
  
  has_one_attached :image
  belongs_to :user
end
