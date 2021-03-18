class EuroPost < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :text, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :user
end
