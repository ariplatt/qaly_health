class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :user_name, :string
  attribute :user_id, :integer

  # Direct associations

  has_many   :demographics_infos

  has_many   :reading_for_patients

  # Indirect associations

  has_many :physician_infos do
    assign_each do |user, physician_infos|
      physician_infos.select do |p|
        p.id.in?(user.physician_infos.map(&:id))
      end
    end
  end
end
