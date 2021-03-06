class Reading < ApplicationRecord
  mount_uploader :self_image, SelfImageUploader

  # Direct associations

  belongs_to :physician

  belongs_to :patient,
             class_name: "User",
             foreign_key: "brain_oxygen_level"

  # Indirect associations

  has_one    :demographic,
             through: :patient,
             source: :demographics

  # Validations

  # Scopes

  def to_s
    created_at
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
