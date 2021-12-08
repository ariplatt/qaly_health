class AddReadingForPatientCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :reading_for_patients_count, :integer
  end
end
