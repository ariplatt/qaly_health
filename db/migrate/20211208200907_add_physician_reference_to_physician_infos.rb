class AddPhysicianReferenceToPhysicianInfos < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :physician_infos, :reading_for_patients,
                    column: :physician_id
    add_index :physician_infos, :physician_id
    change_column_null :physician_infos, :physician_id, false
  end
end
