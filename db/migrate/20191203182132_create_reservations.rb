class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :guest_name
      t.string :guest_email
      t.integer :guest_count
      t.string :restaurant_shift
      t.datetime :restaurant_time
      t.integer :restaurant_id
      t.integer :table_id

      t.timestamps
    end
  end
end
