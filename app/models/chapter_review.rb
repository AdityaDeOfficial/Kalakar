class ChapterReview < ApplicationRecord
  belongs_to :user
  belongs_to :chapter

  validates :rating, presence: true
  validates :content, presence: true
end
