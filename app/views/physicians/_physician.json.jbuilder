json.extract! physician, :id, :user_name, :patient, :patient_id, :hospital_id,
              :hospital_name, :created_at, :updated_at
json.url physician_url(physician, format: :json)
