class Physician < ApplicationRecord
  # Direct associations

  belongs_to :patients,
             class_name: "Demographic",
             foreign_key: "patient_id"

  has_many   :readings,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
