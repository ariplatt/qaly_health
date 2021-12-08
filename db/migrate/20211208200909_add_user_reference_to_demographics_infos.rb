class AddUserReferenceToDemographicsInfos < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :demographics_infos, :users
    add_index :demographics_infos, :user_id
    change_column_null :demographics_infos, :user_id, false
  end
end
