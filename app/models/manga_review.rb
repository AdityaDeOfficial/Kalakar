class MangaReview < ApplicationRecord
  belongs_to :user
  belongs_to :manga

  validates :rating, presence: true
  validates :content, presence: true
end
