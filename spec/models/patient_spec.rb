require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "scope :adults" do
    it "includes adult patients (age > 18)" do
      @patient1 = Patient.create(name: 'Katie Bryce', age: 24)
      @patient2 = Patient.create(name: 'Denny Duquette', age: 39)
      @patient3 = Patient.create(name: 'Zola Shepherd', age: 2)

      expect(Patient.adults).to include(@patient1, @patient2)
      expect(Patient.adults).not_to include(@patient3)
    end
  end

  describe "scope :alphabetical_order" do
    it "orders patients in ascending alphabetical order" do
      @patient1 = Patient.create(name: 'Katie Bryce', age: 24)
      @patient2 = Patient.create(name: 'Denny Duquette', age: 39)
      @patient3 = Patient.create(name: 'Zola Shepherd', age: 2)

      patients = Patient.alphabetical_order

      expect(patients).to eq([@patient2, @patient1, @patient3])
    end
  end
end