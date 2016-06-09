class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :about
      t.integer :stars
      t.string :address
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
