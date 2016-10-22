class Airport < ApplicationRecord
  has_many :flights
  validates :name, :location, presence: true


end
