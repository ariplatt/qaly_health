json.extract! reading, :id, :brain_oxygen_level, :time, :date, :feeling,
              :self_image, :user_name, :brain_pressure_level, :brain_temperature_level, :physician_id, :created_at, :updated_at
json.url reading_url(reading, format: :json)
