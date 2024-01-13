class Bookmark < ApplicationRecord
  validates :comment, length: { minimum: 6 }
  validates :movie, :list, presence: true
  validates_uniqueness_of :movie_id, scope: :list_id

  belongs_to :movie
  belongs_to :list

  before_destroy :check_movie_referenced

  private

  def check_movie_referenced
    throw(:abort) if Movie.exists?(id: movie_id)
  end
end
