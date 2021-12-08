class PhysicianInfo < ApplicationRecord
  # Direct associations

  belongs_to :physician,
             class_name: "ReadingForPatient"

  # Indirect associations

  has_one    :user,
             through: :physician,
             source: :user

  # Validations

  # Scopes

  def to_s
    physician.to_s
  end
end
