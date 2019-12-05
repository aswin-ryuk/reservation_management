class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :max_count
      t.integer :min_count
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
