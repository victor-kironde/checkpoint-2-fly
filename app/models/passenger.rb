class Passenger < ApplicationRecord
  validates :name, :passport_number, :phone, :booking, presence: true
  belongs_to :booking, inverse_of: :passengers
end
