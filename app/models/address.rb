class Address < ActiveRecord::Base
	has_one :student

	validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
end
