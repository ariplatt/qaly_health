class CreateReadingForPatients < ActiveRecord::Migration[6.0]
  def change
    create_table :reading_for_patients do |t|
      t.integer :brain_oxygen_level
      t.integer :brain_pressure_level
      t.integer :brain_temperature_level
      t.time :time
      t.date :date
      t.text :feeling
      t.integer :physician_id
      t.string :physician_name
      t.integer :user_id

      t.timestamps
    end
  end
end
