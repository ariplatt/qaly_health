class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.integer :brain_oxygen_level
      t.time :time
      t.date :date
      t.text :feeling
      t.string :self_image
      t.string :user_name
      t.string :brain_pressure_level
      t.string :brain_temperature_level
      t.integer :physician_id

      t.timestamps
    end
  end
end
