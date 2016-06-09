class Booking < ActiveRecord::Base
  belongs_to :hotel
  attr_reader :status
  def estado
    if status?
      return "Activa"
    else
      return "Cancelada"
    end
  end


end
