class Restaurant < ApplicationRecord

	validates :name, :phone, :email, presence: true
	
	validates :name, uniqueness: { case_sensitive: false }
	validates :phone, length: { minimum: 7, maximum: 10}

	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

	has_many :tables
	has_many :reservations

end
