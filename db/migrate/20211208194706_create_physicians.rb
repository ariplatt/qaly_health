class CreatePhysicians < ActiveRecord::Migration[6.0]
  def change
    create_table :physicians do |t|
      t.string :user_name
      t.string :patient
      t.integer :patient_id
      t.integer :hospital_id
      t.string :hospital_name

      t.timestamps
    end
  end
end
