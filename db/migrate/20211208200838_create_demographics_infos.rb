class CreateDemographicsInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :demographics_infos do |t|
      t.integer :disease_id
      t.string :disease_name
      t.integer :weight
      t.integer :height
      t.date :dob
      t.integer :user_id
      t.string :user_name

      t.timestamps
    end
  end
end
