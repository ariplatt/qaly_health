class ReadingForPatient < ApplicationRecord
  # Direct associations

  has_many   :physician_infos,
             foreign_key: "physician_id",
             dependent: :destroy

  belongs_to :user,
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    brain_oxygen_level
  end
end
