class DropReserves < ActiveRecord::Migration
  def change
    drop_table :reserves
  end
end
