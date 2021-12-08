class ReadingResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :brain_oxygen_level, :integer
  attribute :time, :string
  attribute :date, :date
  attribute :feeling, :string
  attribute :self_image, :string
  attribute :user_name, :string
  attribute :email, :string
  attribute :password, :string
  attribute :brain_pressure_level, :string
  attribute :brain_temperature_level, :string
  attribute :physician_id, :integer

  # Direct associations

  belongs_to :physician

  belongs_to :patient,
             resource: UserResource,
             foreign_key: :brain_oxygen_level

  # Indirect associations

  has_one    :demographic
end
