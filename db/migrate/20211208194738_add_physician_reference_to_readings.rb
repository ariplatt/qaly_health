class AddPhysicianReferenceToReadings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :readings, :physicians
    add_index :readings, :physician_id
    change_column_null :readings, :physician_id, false
  end
end
