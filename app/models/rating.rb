class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user_id, presence: true
  validates :rating, presence: true, numericality: { in: 0..5 }
end
