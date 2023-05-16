class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :mangas, dependent: :destroy
  has_many :manga_reviews, dependent: :destroy
  has_many :chapter_reviews, dependent: :destroy
  acts_as_favoritor
end
