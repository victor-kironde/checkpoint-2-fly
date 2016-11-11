class Airport < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :name, :city, :country, :latitude,
            :longitude, presence: true

  def self.get_airports
    order(country: :asc,
          city: :asc, name: :asc, code: :asc)
  end

  def formatted
    "#{country} - #{city} - #{name} (#{code})"
  end
end
