class Manga < ApplicationRecord
  belongs_to :user
  has_one_attached :cover_image
  has_many :chapters
  has_many :manga_reviews
end
