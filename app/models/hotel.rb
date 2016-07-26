class Hotel < ActiveRecord::Base
	has_many :bookings,inverse_of: :hotel
  accepts_nested_attributes_for :bookings

  def as_json(options={})
    {
        id: self.id,
        name: self.name
    }
  end


end