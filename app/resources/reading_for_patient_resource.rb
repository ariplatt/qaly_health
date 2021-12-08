class ReadingForPatientResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :brain_oxygen_level, :integer
  attribute :brain_pressure_level, :integer
  attribute :brain_temperature_level, :integer
  attribute :time, :string
  attribute :date, :date
  attribute :feeling, :string
  attribute :physician_id, :integer
  attribute :physician_name, :string
  attribute :user_id, :integer

  # Direct associations

  has_many   :physician_infos,
             foreign_key: :physician_id

  belongs_to :user

  # Indirect associations
end
