json.extract! reading_for_patient, :id, :brain_oxygen_level,
              :brain_pressure_level, :brain_temperature_level, :time, :date, :feeling, :physician_id, :physician_name, :user_id, :created_at, :updated_at
json.url reading_for_patient_url(reading_for_patient, format: :json)
