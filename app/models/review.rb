class Review < ApplicationRecord
  belongs_to :movie

  def stars_as_percent
    (stars / 5.0) * 100.0
  end

  validates :name, presence: true
  validates :comment, length: { minimum: 4 }
  STARS = [1, 2, 3, 4, 5]
  validates :stars, inclusion: {
    in: STARS,
    message: "must be between 1 and 5"
  }
end
