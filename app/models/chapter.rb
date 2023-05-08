class Chapter < ApplicationRecord
  belongs_to :manga
  has_many_attached :chapter_photos
  has_many :chapter_reviews
end
