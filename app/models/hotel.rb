class Hotel < ActiveRecord::Base
	has_many :bookings,inverse_of: :hotel
  accepts_nested_attributes_for :bookings
  validates_presence_of :name

  def self.search(search)
    if search
      # find(:all,:conditions => ['name LIKE ?', "%#{search}%"])
      @q = "%#{search}%"
      where("name ILIKE ?",@q)
    else
      find(:all)
    end
  end
end