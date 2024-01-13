class Movie < ApplicationRecord
  validates :title, :overview, presence: true
  validates :title, uniqueness: true

  has_many :bookmarks, dependent: :restrict_with_error

  before_destroy :check_for_bookmarks

  private

  def check_for_bookmarks
    throw(:abort) if bookmarks.exists?
  end
end
