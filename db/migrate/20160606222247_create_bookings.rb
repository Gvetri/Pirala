class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.boolean :status
      t.date :date_in
      t.date :date_out
      t.references :hotel, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
