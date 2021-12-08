class AddUserReferenceToReadingForPatients < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reading_for_patients, :users
    add_index :reading_for_patients, :user_id
    change_column_null :reading_for_patients, :user_id, false
  end
end
