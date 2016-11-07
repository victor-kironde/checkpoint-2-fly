class Passenger < ApplicationRecord
  validates :name, :passport_number, :phone, presence: true
  belongs_to :booking, inverse_of: :passengers
  validates_presence_of :booking
end
