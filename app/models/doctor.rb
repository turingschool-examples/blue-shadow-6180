class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :appointments
  has_many :patients, through: :appointments
end