class Demographic < ApplicationRecord
  # Direct associations

  has_many   :physicians,
             foreign_key: "patient_id"

  belongs_to :patient,
             class_name: "User",
             foreign_key: "disease_id"

  # Indirect associations

  has_one    :diagnosis,
             through: :patient,
             source: :brain_oxygens

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
