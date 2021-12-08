class AddPatientReferenceToReadings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :readings, :users, column: :brain_oxygen_level
    add_index :readings, :brain_oxygen_level
    change_column_null :readings, :brain_oxygen_level, false
  end
end
