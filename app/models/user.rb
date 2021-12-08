class User < ApplicationRecord
  
  include JwtToken
# Direct associations

  has_many   :demographics,
             :foreign_key => "disease_id"

  has_many   :brain_oxygens,
             :class_name => "Reading",
             :foreign_key => "brain_oxygen_level",
             :dependent => :destroy

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
