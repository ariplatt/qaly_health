json.extract! demographics_info, :id, :disease_id, :disease_name, :weight,
              :height, :dob, :user_id, :user_name, :created_at, :updated_at
json.url demographics_info_url(demographics_info, format: :json)
