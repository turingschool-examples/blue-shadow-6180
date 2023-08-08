class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments

  def self.adults_alphabetical_order
    where("age > ?", 18).order(:name)
  end
  
end
