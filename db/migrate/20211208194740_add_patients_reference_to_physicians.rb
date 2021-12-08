class AddPatientsReferenceToPhysicians < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :physicians, :demographics, column: :patient_id
    add_index :physicians, :patient_id
    change_column_null :physicians, :patient_id, false
  end
end
