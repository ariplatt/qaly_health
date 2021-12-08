class CreatePhysicianInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :physician_infos do |t|
      t.integer :physician_id
      t.string :physician_name
      t.integer :hospital_id
      t.string :hospital_name

      t.timestamps
    end
  end
end
