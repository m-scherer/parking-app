class Admin < ApplicationRecord
  validates :email, :first_name, :last_name, presence: true 
  has_secure_password
end
