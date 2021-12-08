class CreateDemographics < ActiveRecord::Migration[6.0]
  def change
    create_table :demographics do |t|
      t.string :user_name
      t.string :disease_name
      t.integer :disease_id
      t.date :date_diagnosed
      t.time :time_diagnosed
      t.text :description_of_illness

      t.timestamps
    end
  end
end
