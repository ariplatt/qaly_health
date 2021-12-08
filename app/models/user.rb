class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :demographics_infos,
             dependent: :destroy

  has_many   :reading_for_patients,
             dependent: :destroy

  # Indirect associations

  has_many   :physician_infos,
             through: :reading_for_patients,
             source: :physician_infos

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
