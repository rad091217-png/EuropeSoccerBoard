class LaligaPost < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :text, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :laliga_post_likes
  has_many :liked_users, through: :laliga_post_likes, source: :user
end
