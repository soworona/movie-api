class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  
  validates :comment, presence: true
  validates :user_id, presence: true
end
