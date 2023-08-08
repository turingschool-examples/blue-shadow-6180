require 'rails_helper'

RSpec.describe Patient, type: :model do

  describe "associations" do
    it { should have_many(:appointments) }
    it { should have_many(:doctors).through(:appointments) }
  end
  
  describe "age" do
    it "includes adult patients (age > 18)" do
      @patient1 = Patient.create(name: 'Katie Bryce', age: 24)
      @patient2 = Patient.create(name: 'Denny Duquette', age: 39)
      @patient3 = Patient.create(name: 'Zola Shepherd', age: 2)

      adult_patients = Patient.where("age > ?", 18)

      expect(adult_patients).to include(@patient1, @patient2)
      expect(adult_patients).not_to include(@patient3)
    end
  end

  describe "alphabetical order" do
    it "orders patients in ascending alphabetical order" do
      @patient1 = Patient.create(name: 'Catherine Avery', age: 30)
      @patient2 = Patient.create(name: 'Richard Webber', age: 45)
      @patient3 = Patient.create(name: 'Alex Karev', age: 28)

      alphabetical_patients = Patient.order(:name)

      expect(alphabetical_patients).to eq([@patient3, @patient1, @patient2])
    end
  end
end