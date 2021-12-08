json.extract! physician_info, :id, :physician_id, :physician_name,
              :hospital_id, :hospital_name, :created_at, :updated_at
json.url physician_info_url(physician_info, format: :json)
