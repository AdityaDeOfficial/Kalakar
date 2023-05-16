class Manga < ApplicationRecord
  belongs_to :user
  has_one_attached :cover_image
  has_many :chapters, dependent: :destroy
  has_many :manga_reviews, dependent: :destroy
  acts_as_favoritable
  acts_as_taggable

  validates :manga_title, presence: true
  validates :description, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_tags,
                  against: :manga_title,
                  associated_against: {
                    tags: :name
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
