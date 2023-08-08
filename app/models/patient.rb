class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments

  scope :adults, -> { where("age > ?", 18) }
  scope :alphabetical_order, -> { order(:name) }
end
