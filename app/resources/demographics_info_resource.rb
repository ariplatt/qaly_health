class DemographicsInfoResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :disease_id, :integer
  attribute :disease_name, :string
  attribute :weight, :integer
  attribute :height, :integer
  attribute :dob, :date
  attribute :user_id, :integer
  attribute :user_name, :string

  # Direct associations

  belongs_to :user

  # Indirect associations
end
