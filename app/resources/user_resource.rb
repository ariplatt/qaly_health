class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :user_name, :string

  # Direct associations

  has_many   :demographics,
             foreign_key: :disease_id

  has_many   :brain_oxygens,
             resource: ReadingResource,
             foreign_key: :brain_oxygen_level

  # Indirect associations

end
