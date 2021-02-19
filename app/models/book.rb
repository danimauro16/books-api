class Book < ApplicationRecord
  has_many :book_genres
  has_many :genres, through: :book_genres
  validates :title, presence: true
  validates :isbn, presence: true
  validates :author, presence: true
  validates :editorial, presence: true
  validates :publication_year, presence: true
  validates :photo, presence: true
end
