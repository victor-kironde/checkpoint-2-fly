class Airport < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :name, :city, :country, :latitude,
            :longitude, presence: true

  def self.get_airports
    order(country: :asc)
  end

  def formatted
    "#{country} - #{city} - #{name} (#{code})"
  end
  has_many :flights
  validates :name, :location, presence: true
end
