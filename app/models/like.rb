class Like < ApplicationRecord
  belongs_to :laliga_post
  belongs_to :user
  belongs_to :laliga_post
  validates_uniqueness_of :laliga_post_id, scope: :user_id
end
