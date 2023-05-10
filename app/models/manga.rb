class Manga < ApplicationRecord
  belongs_to :user
  has_one_attached :cover_image
  has_many :chapters
  has_many :manga_reviews
  acts_as_favoritable
  acts_as_taggable

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
