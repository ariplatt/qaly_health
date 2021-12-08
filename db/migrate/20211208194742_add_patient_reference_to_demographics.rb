class AddPatientReferenceToDemographics < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :demographics, :users, column: :disease_id
    add_index :demographics, :disease_id
    change_column_null :demographics, :disease_id, false
  end
end
