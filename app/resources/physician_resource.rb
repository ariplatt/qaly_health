class PhysicianResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :user_name, :string
  attribute :patient, :string
  attribute :patient_id, :integer
  attribute :hospital_id, :integer
  attribute :hospital_name, :string

  # Direct associations

  belongs_to :patients,
             resource: DemographicResource,
             foreign_key: :patient_id

  has_many   :readings

  # Indirect associations
end
