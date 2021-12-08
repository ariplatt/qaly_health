ActiveAdmin.register Reading do

 permit_params :brain_oxygen_level, :time, :date, :feeling, :self_image, :user_name, :email, :password, :brain_pressure_level, :brain_temperature_level, :physician_id

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
