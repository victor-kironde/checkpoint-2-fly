class User < ApplicationRecord
  validates :first_name, :last_name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum:25}
  has_many :bookings


  validates :password, length: {
     minimum: 5,
     confirmation: true
   }
   VALID_EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
   validates :email,
            uniqueness: true,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL }


    has_secure_password

    def full_name
      "#{first_name.capitalize} #{last_name.capitalize}"
    end
  end
