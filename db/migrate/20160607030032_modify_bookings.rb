class ModifyBookings < ActiveRecord::Migration
  def change
    change_column :bookings, :status, :boolean, :default => true
  end
end
