class Booking < ActiveRecord::Base
  belongs_to :hotel
  belongs_to :user
  attr_reader :status

  def estado
    if status?
      return "Activa"
    else
      return "Cancelada"
    end
  end


end
