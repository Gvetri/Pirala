class AddStatusToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :status, :boolean
  end
end
