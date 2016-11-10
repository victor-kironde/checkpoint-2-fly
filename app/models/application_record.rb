class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  VALID_EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
