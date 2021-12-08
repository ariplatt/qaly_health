class DemographicResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :user_name, :string
  attribute :disease_name, :string
  attribute :disease_id, :integer
  attribute :date_diagnosed, :date
  attribute :time_diagnosed, :string
  attribute :description_of_illness, :string

  # Direct associations

  # Indirect associations

end
