class PhysicianInfoResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :physician_id, :integer
  attribute :physician_name, :string
  attribute :hospital_id, :integer
  attribute :hospital_name, :string

  # Direct associations

  belongs_to :physician,
             resource: ReadingForPatientResource

  # Indirect associations

  has_one    :user
end
