class Airport < ApplicationRecord
  has_many :flights
  validates :name, :location, presence: true

  scope :airports_all, -> { order("id ASC") }

end
