class Hotel < ActiveRecord::Base
	has_many :bookings,inverse_of: :hotel
  accepts_nested_attributes_for :bookings
end